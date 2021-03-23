//
//  Bundle_Decodable.swift
//  Green4all
//
//  Created by vincent schmitt on 23/03/2021.
//

import Foundation
/*
struct StockPrice : Codable{
    let open: String
    let close: String
    let high: String
    let low: String
    let volume: String
    
    private enum CodingKeys: String, CodingKey {
        
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}

struct StocksDaily : Codable {
    let timeSeriesDaily: [String: StockPrice]?
    
    private enum CodingKeys: String, CodingKey {
        case timeSeriesDaily = "Time Series (Daily)"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        timeSeriesDaily = try (values.decodeIfPresent([String : StockPrice].self, forKey: .timeSeriesDaily))
    }
 
}
*/

extension Bundle {
    func decode(_ file: String) -> StocksDaily {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(StocksDaily.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
