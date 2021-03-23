//
//  MarketListJson.swift
//  Green4all
//
//  Created by vincent schmitt on 23/03/2021.
//

import SwiftUI

struct MarketListJson: View {
    
    /* to load .json file
    let IBMstockData = Bundle.main.decode("IBM2021-03-22.json")
    let lastRefreshed = "2021-03-22"
    */
    
    @ObservedObject var stockAAPL = StockData(stockSymbol: "AAPL")
    @ObservedObject var stockIBM = StockData(stockSymbol: "IBM")
    @ObservedObject var stockMSFT = StockData(stockSymbol: "MSFT")
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    init() {
        UITableView.appearance().backgroundColor = uicolorBackground
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    private func assign(item: String) -> StockData {
        switch(item) {
        case "AAPL": return stockAAPL
        case "IBM": return stockIBM
        //case "MSFT": return stockMSFT
        default:
            return StockData(stockSymbol: "")
        }
    }
    
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
            colorBackground
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
                    //ForEach(searchedItem.indices) {index in
                    ForEach(searchedItem) { element in
                        
                        //ForEach(modelData.assetInfos) { element in
                    //ForEach(filteredItem) { element in
                        NavigationLink( destination: //MarketAssetDataDetailView(item: element, stocks: assign(item: element.symbol)),
                            MarketDetail(assetInfo: element),
                            //MarketDetail(assetInfo: searchedItem[index]),
                        label: {
                            //Text(element.symbol)
                            AssetDataRow(element:  element)
                            //AssetDataRow(element:  searchedItem[index])
                                .background(colorTranparent)//(index  % 2 == 0) ? colorTranparent : colorTranparentMedium)//.listRowBackground((index  % 2 == 0) ? Color(.systemBlue) : Color(.red))
                            
                        })//.listRowBackground((index  % 2 == 0) ? Color(.systemBlue) : Color(.red))
                    }.buttonStyle(PlainButtonStyle()).padding(.horizontal)
                    }
                }
            }
        
        .navigationBarTitle(Text("Marché vert"))
        .foregroundColor(.white)

        }
    }
}

struct MarketListJson_Previews: PreviewProvider {
    static var previews: some View {
        MarketListJson().environmentObject(ModelData())
    }
}

extension MarketListJson {
    private func AssetDataRow(element: AssetInfo) -> some View {
        //@EnvironmentObject let item: AssetInfo
        
        //let myStock = stock(item: element.symbol)
        
        return
            
            HStack{
            VStack(alignment: .leading) {
                Text(element.symbol).font(.title2).fontWeight(.bold)
                Text(element.company).foregroundColor(colorForeGroundGreenDark)
                //Text(greenFinanceCollections[element.symbol]?.assetInfo.company ?? "")
            }
            
            Spacer()
                
                LineView(
                    data: assign(item: "\(element.symbol)").prices,
                        //stockIBM.prices,
                    title: element.symbol,
                    price: "\(assign(item: "\(element.symbol)").currentPrice) USD")//"\(stockAAPL.currentPrice) USD")
                //.frame(width: 300, height: 250)
                //.background(Color.white)
            Spacer()
            
            VStack(alignment: .trailing) {
                //Text("stocks.close, specifier: "%.2f")")
                //stockData.last?.value.close ?? "..."
                //Text("\(Double(stockAAPL.close) ?? 0.0 , specifier: "%.2f")")
                Text("\(Double(assign(item: "\(element.symbol)").close) ?? 0.0, specifier: "%.2f")")
                change(element: element)
            }

                if element.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }

            Text(">")
            //Image(systemName: "arrowtriangle.right")
        }.padding(.all, 5.0)
            
    }
}

extension MarketListJson {
    private func change(element: AssetInfo) -> some View {
        
        let open = Double(assign(item: element.symbol).open) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let currentPrice = Double(assign(item: element.symbol).currentPrice) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let close = Double(assign(item: element.symbol).close) ?? 0.0//Double(stockAAPL.close) ?? 0
        let priceChange = currentPrice - close
        let percentChange = priceChange / currentPrice * 100
        
    let colorChange = priceChange >= 0 ? Color.green : Color.red
    
    return
    
    Text("\(percentChange, specifier: "%.2f")%").background(colorChange)

    }
}
