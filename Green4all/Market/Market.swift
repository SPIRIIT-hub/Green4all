//
//  Market.swift
//  Green4all
//
//  Created by vincent schmitt on 18/03/2021.
//

import SwiftUI

struct Market: View {
    @ObservedObject var stocks = Stocks()
    @State var item = aapl

    var itemData = aaplTimeSeriesIntraday
    var body: some View {
        NavigationView {
        ZStack {
            Color.white
                .ignoresSafeArea()
        
            VStack(alignment: .leading)  {
                Text(itemData.lastRefreshedTimeSeries, style: .date).padding()
                    
                ScrollView {
                ForEach(0..<10) { _ in
                    NavigationLink(
                        destination: MarketAssetDataDetailView(item: item, itemData: itemData, stocks: stocks),
                        label: {
                            AssetDataRow
                        })
                }
                }
            }
        }
        .navigationTitle("Marché vert")
        }
    }
}

struct Market_Previews: PreviewProvider {
    static var previews: some View {
        Market()
    }
}

extension Market {
    private var AssetDataRow: some View {

        HStack{
            VStack(alignment: .leading) {
                Text(item.symbol).font(.title2).fontWeight(.bold)
                Text(item.name)
            }
            //Spacer()
            LineView(data: stocks.prices, title: item.symbol, price: "\(stocks.currentPrice) USD")
                //.frame(width: 300, height: 250)
            VStack(alignment: .trailing) {
                Text("\(itemData.close, specifier: "%.2f")")
                change
            }
            
            if item.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            Text(">")
            //Image(systemName: "arrowtriangle.right")
        }.padding(.all, 5.0)
    }
}

extension Market {
    private var change : some View {
        
    let open = itemData.open
    let close = itemData.close
    let priceChange = open - close
    let percentChange = priceChange / open * 100
    let colorChange = priceChange > 0 ? Color.green : Color.red
    
    return
    
    Text("\(percentChange, specifier: "%.2f")%").background(colorChange)

    }
}
