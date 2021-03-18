//
//  MarketModel.swift
//  Green4all
//
//  Created by vincent schmitt on 18/03/2021.
//

import Foundation

struct AssetInfo: Identifiable {
    var id = UUID()
    var symbol: String
    var name: String
    var company: String
    var lastRefreshed: Date
    var intradayInterval: Int
    var outputSize: String  //compact or full
    var timeZone: String //US/Eastern
    //var timeSeries: Array<TimeSeries>
}

struct TimeSeries: Identifiable {
    var id = UUID()
    var temporalResolutions: TypeTemporalResolution
    var lastRefreshedTimeSeries: Date
    var open: Double
    var high: Double
    var low: Double
    var close: Double
    var volume: Double
}

enum TypeTemporalResolution {
    case intraday(min: Int), daily, weekly, monthly
}

let now = Date()

let aapl = AssetInfo(symbol: "AAPL", name: "Apple Inc.", company: "Apple Inc", lastRefreshed: now, intradayInterval: 5, outputSize: "compact", timeZone: "US/Eastern")
let aaplTimeSeriesIntraday = TimeSeries(temporalResolutions: TypeTemporalResolution.intraday(min: 5), lastRefreshedTimeSeries: now, open: 124.05, high: 125.86, low: 122.34, close: 124.76, volume: 111440000)
