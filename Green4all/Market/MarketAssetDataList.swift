//
//  MarketAssetDataList.swift
//  Green4all
//
//  Created by vincent schmitt on 21/03/2021.
//

import SwiftUI

struct MarketAssetDataList: View {

    // ** to save API request
    @ObservedObject var stocks = Stocks(stockSymbol: "")
    @EnvironmentObject var modelData : ModelData
    
    init() {
            UITableView.appearance().backgroundColor = .yellow // Uses UIColor
        }
    
    @State private var showFavoritesOnly = false
    
    var filteredItem: [AssetInfo] {
        modelData.assetInfos.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var searchedItem: [AssetInfo] {
        filteredItem.filter {
            searchText.isEmpty || $0.symbol.localizedStandardContains(searchText) || $0.company.localizedStandardContains(searchText)
        }
    }

    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
        ZStack {
            Color.green
                .ignoresSafeArea()
        
            VStack(alignment: .leading) {
                // SearchBar
                SearchBar(searchText: $searchText)
                
                Text(now, style: .date).padding()
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                .padding(.horizontal)
                
                ScrollView {
                    ForEach(searchedItem) { element in
                    //ForEach(filteredItem) { element in
                    NavigationLink(
                        destination: MarketAssetDataDetailView(item: element, stocks: stocks),
                        label: {
                            AssetDataRow
                        }).buttonStyle(PlainButtonStyle()).padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("Marché vert")
        }
    }
}

struct MarketAssetDataList_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        MarketAssetDataList().environmentObject(ModelData())
    }
}

extension MarketAssetDataList {
    private var AssetDataRow: some View {
        let item = aaplInfo
        //let item = stocks
        
        return
        
            HStack{
            VStack(alignment: .leading) {
                Text(item.symbol).font(.title2).fontWeight(.bold)
                Text(item.name)
            }
            
            Spacer()

            LineView(data: stocks.prices, title: item.symbol, price: "\(stocks.currentPrice) USD")
                //.frame(width: 300, height: 250)
                .background(Color.white)
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(Double(stocks.close) ?? 0, specifier: "%.2f")")
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

extension MarketAssetDataList {
    private var change : some View {
        
        let open = Double(stocks.open)
        let close = Double(stocks.close) ?? 0
        let priceChange = open ?? 0 - close
        let percentChange = priceChange / (open ?? 0) * 100
    let colorChange = priceChange > 0 ? Color.green : Color.red
    
    return
    
    Text("\(percentChange, specifier: "%.2f")%").background(colorChange)

    }
}
