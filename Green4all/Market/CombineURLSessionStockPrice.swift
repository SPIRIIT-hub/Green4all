//
//  CombineURLSessionStockPrice.swift
//  ProtocolAFPEexample
//
//  Created by yoko on 11/03/2021.
//

import Foundation
import Combine

class Stocks : ObservableObject{
    
    @Published var prices = [Double]()
    @Published var currentPrice = "...."
    var urlBase = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=2OZPW2NW0AT07VNL&datatype=json"
    
    var cancellable : Set<AnyCancellable> = Set()
    
    init() {
        fetchStockPrice()
    }
    
    func fetchStockPrice(){
        
        URLSession.shared.dataTaskPublisher(for: URL(string: "\(urlBase)")!)
            .map{output in
                
                return output.data
        }
        .decode(type: StocksDaily.self, decoder: JSONDecoder())
        .sink(receiveCompletion: {_ in
            print("completed")
        }, receiveValue: { value in

            var stockPrices = [Double]()
            
            let orderedDates =  value.timeSeriesDaily?.sorted{
                guard let d1 = $0.key.stringDate, let d2 = $1.key.stringDate else { return false }
                return d1 < d2
            }
            
            guard let stockData = orderedDates else {return}
            
            for (_, stock) in stockData{
                if let stock = Double(stock.close){
                    if stock > 0.0{
                        stockPrices.append(stock)
                    }
                }
            }
            
            DispatchQueue.main.async{
                self.prices = stockPrices
                self.currentPrice = stockData.last?.value.close ?? "..."
            }
        })
            .store(in: &cancellable)
        
    }
}

extension String {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    var stringDate: Date? {
        return String.shortDate.date(from: self)
    }
}
