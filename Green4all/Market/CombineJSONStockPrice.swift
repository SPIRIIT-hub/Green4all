//
//  CombineJSONStockPrice.swift
//  Green4all
//
//  Created by vincent schmitt on 23/03/2021.
//

import Foundation
import Combine

class StockData : ObservableObject {
    
    @Published var prices = [Double]()
    @Published var date = ""  // added by yoko
    @Published var currentPrice = "...."
    @Published var open = ""
    @Published var close = ""
    @Published var high = ""
    @Published var low = ""
    @Published var volume = ""

    //var stockSymbol: String = ""
    
    private var stockFunction = "TIME_SERIES_DAILY"
    var stockSymbol = ""
    private var apiKey = "2OZPW2NW0AT07VNL"
    /*
    var urlBase = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=2OZPW2NW0AT07VNL&datatype=json"
    */
    
    var cancellable : Set<AnyCancellable> = Set()
    
    init(stockSymbol: String) {
        self.stockSymbol = stockSymbol
        fetchStockPrice()
    }
    
    func fetchStockPrice(){
        /*
        let urlBase =
            "http://localhost:8888/test/green4all/IBMStockData.json"
            //"http://www.vinsfinsmotohama.shop/test/green4all/IBMStockData.json" //"https://www.alphavantage.co/query?function=\(stockFunction)&symbol=\(stockSymbol)&apikey=\(apiKey)&datatype=json" //"https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=2OZPW2NW0AT07VNL&datatype=json"
        
        */
        /*
        URLSession.shared.dataTaskPublisher(for: URL(string: "\(urlBase)")!)
            .map{output in
                
                return output.data
        }
        .decode(type: StocksDaily.self, decoder: JSONDecoder())
        .sink(receiveCompletion: {_ in
            print("completed")
        }, receiveValue: { value in
        */
            var stockPrices = [Double]()
        
        let lastRefreshed = "2021-03-22"
        let myStockDataJsonFile = stockSymbol + lastRefreshed
        //let myStockData = Bundle.main.decode("IBM2021-03-22.json")
        let value = Bundle.main.decode(myStockDataJsonFile)
        print("load completed. value.timeSeriesDaily.count = ")
        print(value.timeSeriesDaily?.count)//IBMstockData.timeSeriesDaily?[lastRefreshed]?.open ?? "none")
            let orderedDates =  value.timeSeriesDaily?.sorted{
            //let orderedDates =  value.timeSeriesDaily?.sorted{
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
                self.open = stockData.last?.value.open ?? "..."
                self.close = stockData.last?.value.close ?? "..."
                self.high = stockData.last?.value.high ?? "..."
                self.low = stockData.last?.value.low ?? "..."
                self.volume = stockData.last?.value.volume ?? "..."
            }
        /*})*/
            //.store(in: &cancellable)
        
    }
}

