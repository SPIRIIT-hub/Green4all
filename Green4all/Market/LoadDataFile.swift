//
//  LoadDataFile.swift
//  Green4all
//
//  Created by vincent schmitt on 22/03/2021.
//

import Foundation
import Combine

/*
struct MyStock: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
*/

/*
struct AssetData: Hashable, Codable, Identifiable {
    let id = UUID()
    let open: String
    let high: String
    let low: String
    let close: String
    let volume: String
}

final class StockData: ObservableObject {
    @Published var ibmStockData: [AssetData] = load("IBMStockData.json")
}
*/


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
