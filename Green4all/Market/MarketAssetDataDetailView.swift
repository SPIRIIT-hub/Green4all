//
//  MarketAssetDataDetailView.swift
//  Green4all
//
//  Created by vincent schmitt on 18/03/2021.
//

import SwiftUI

struct MarketAssetDataDetailView: View {
    @EnvironmentObject var modelData: ModelData
    @State var item : AssetInfo //= aaplInfo
    //var itemData = aaplTimeSeriesIntraday
    
    // ** to save API request
    @ObservedObject var stocks = Stocks(stockSymbol: "AAPL")
    
    var body: some View {
        //NavigationView {
        
            List {
                //VStack(alignment: .leading) {
                Group {
                    HStack {
                    //Text(item.symbol).font(.title)
                        Text(item.name)
                        Spacer()
                        FavoriteButton(isSet: $item.isFavorite)
                    }
                    HStack {
                        //Text("\(itemData.lastRefreshedTimeSeries.assetDatas[0].close, specifier: "%.2f")").font(.title)
                        Text("\(Double(stocks.close) ?? 0.00, specifier: "%.2f")").font(.title)
                        Spacer()
                        change
                        
                    }
                    //shortDate(now)
                
                //graph
                //    GeometryReader{ geom in
                    LineView(data: stocks.prices, title: item.symbol, price: "\(stocks.currentPrice) USD")
                    .frame(minWidth: 100, idealWidth: 300, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 100, idealHeight: 250, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)  //(width: 300, height: 250,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        //(width: geom.frame(in: .local).width , height: 250)
                    .background(Color.white)
                    //}
                //datas
                    /*
                    dataListView(title: "High", data: itemData.lastRefreshedTimeSeries.assetDatas[0].high )
                    dataListView(title: "Low", data: itemData.lastRefreshedTimeSeries.assetDatas[0].low)
                    */
                    dataListView(title: "Open", data: stocks.open)
                    dataListView(title: "Close", data: stocks.close)
                    dataListView(title: "High", data: stocks.high )
                    dataListView(title: "Low", data: stocks.low)
                    dataListView(title: "Volume", data: stocks.volume)
                    
                }
                .listRowBackground(Color.blue)
            //}
            .navigationTitle(
                item.symbol)
            
        }
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct MarketAssetDataDetailView_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        MarketAssetDataDetailView(item: modelData.assetInfos[0])
    }
}

extension MarketAssetDataDetailView {
    private var change : some View {
        
        //let open = Double(stocks.open) ?? 0.0
        let close = Double(stocks.close) ?? 0.0
        let currentPrice = Double(stocks.currentPrice) ?? 0.0
        let priceChange = currentPrice - close
        let percentChange = priceChange / (currentPrice) * 100
    let colorChange = priceChange >= 0 ? Color.green : Color.red
        
    return
            
    HStack {
        Spacer()
        Text("\(priceChange, specifier: "%.2f")").font(.title2).padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/).background(colorChange)
        Spacer()
        Text("(\(percentChange, specifier: "%.2f")%)").font(.title2).padding(.horizontal).background(colorChange)
    }
    }
}

extension MarketAssetDataDetailView {
    //private func dataListView(title: String, data: Double) -> some View {
    private func dataListView(title: String, data: String) -> some View {
        HStack {
                Text(title)
            Spacer()
                //Text("\(data, specifier: "%.2f")")
            Text("\(Double(data) ?? 0, specifier: "%.2f")")
        }
    }
}
