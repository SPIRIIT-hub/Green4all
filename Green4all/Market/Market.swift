//
//  Market.swift
//  Green4all
//
//  Created by vincent schmitt on 18/03/2021.
//

import SwiftUI

struct Market: View {
    var item = aapl
    var itemData = aaplTimeSeriesIntraday
    var body: some View {
        NavigationView {
            VStack(alignment: .leading)  {
                Text(itemData.lastRefreshedTimeSeries, style: .date).padding()
                    
                List {
                ForEach(0..<10) { _ in
                    
                    AssetDataRow(item: self.item, itemData:  self.itemData)
                    
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

struct AssetDataRow: View {
    var item: AssetInfo
    var itemData: TimeSeries
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.symbol).font(.title2).fontWeight(.bold)
                Text(item.name)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(itemData.close)")
                Text("\((itemData.open - itemData.close)/itemData.close*100)%")
            }
        }
    }
}
