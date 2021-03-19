//
//  MarketAssetDataDetailView.swift
//  Green4all
//
//  Created by vincent schmitt on 18/03/2021.
//

import SwiftUI

struct MarketAssetDataDetailView: View {
    @State var item = aapl
    var itemData = aaplTimeSeriesIntraday
    
    @ObservedObject var stocks = Stocks()
    
    var body: some View {
        //NavigationView {
            List {
                //VStack(alignment: .leading) {
                    HStack {
                    //Text(item.symbol).font(.title)
                        Text(item.name)
                        Spacer()
                        FavoriteButton(isSet: $item.isFavorite)
                    }
                    HStack {
                        Text("\(itemData.close, specifier: "%.2f")").font(.title)
                        Spacer()
                        change
                    }
                
                //graph
                LineView(data: stocks.prices, title: "AAPL", price: "\(stocks.currentPrice) USD")
                    .frame(width: 300, height: 250)
                    //.background(Color.blue)
                    
                //datas
                dataListView(title: "Open", data: itemData.open)
                dataListView(title: "Close", data: itemData.close)
                dataListView(title: "High", data: itemData.high )
                dataListView(title: "Low", data: itemData.low)
                dataListView(title: "Volume", data: itemData.volume)
                
                //}
            //}
            .navigationTitle(
                item.symbol)
                
        }
    }
}

struct MarketAssetDataDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MarketAssetDataDetailView()
    }
}

extension MarketAssetDataDetailView {
    private var change : some View {
        
    let open = itemData.open
    let close = itemData.close
    let priceChange = open - close
    let percentChange = priceChange / open * 100
    let colorChange = priceChange > 0 ? Color.green : Color.red
        
    return
            
    HStack {
        Text("\(priceChange, specifier: "%.2f")").font(.title2).padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/).background(colorChange)
        Spacer()
        Text("(\(percentChange, specifier: "%.2f")%)").font(.title2).padding(.horizontal).background(colorChange)
    }
    }
}

extension MarketAssetDataDetailView {
    private func dataListView(title: String, data: Double) -> some View {
        HStack {
                Text(title)
            Spacer()
                Text("\(data, specifier: "%.2f")")
        }
    }
}
