//
//  TestView.swift
//  Green4all
//
//  Created by vincent schmitt on 19/03/2021.
//

import SwiftUI

struct TestView: View {
    @State private var showSheet = false
    //@EnvironmentObject var stockData : StockData
    //@EnvironmentObject var stockData: StockData
    /*
    let IBMstockData = Bundle.main.decode("IBM2021-03-22.json")
    let lastRefreshed = "2021-03-22"
    */
    @ObservedObject var stockAAPL = StockData(stockSymbol: "AAPL")
    
    init() {
            UITableView.appearance().backgroundColor = .yellow // Uses UIColor
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
                //Text(lastRefreshed)
                Text(stockAAPL.currentPrice)
                Text(stockAAPL.open)
                Text(stockAAPL.close)
                    
                //IBMstockData.timeSeriesDaily?[lastRefreshed]?.open ?? "none")
                //Text(IBMstockData.timeSeriesDaily?[lastRefreshed]?.close ?? "none")
                Text(now, style: .date)
                                
                //Text(String.shortDate.date(from: now))
                /*
                GeometryReader { geo in
                    Image(uiImage: textToImage(drawText: "Test", inImage: UIImage(named: "Image")!, atPoint: CGPoint(x: geo.size.width, y: geo.size.height)))
                    //.resizable()
                    //.aspectRatio(contentMode: .fit)
                    //.scaledToFit()
                        .frame(width: geo.size.width)
                    //.background(Color.green)
                }
                */
                /*
                GeometryReader { geo in
                    Image("Image")
                        .resizable()
                        //.scaledToFill()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 300)
                        //.scaledToFill()
                        .background(Color.blue)
                        .overlay(Text("OK").foregroundColor(.white), alignment: .bottomTrailing)
                }
                 */
                        //Image("Example")
                        //    .resizable()
                        //    .aspectRatio(contentMode: .fit)
                        //    .frame(width: geo.size.width, height: 300)
            /*
            .navigationBarItems(trailing: Button(action: {
                    //print("Open profile sheet")
                self.showSheet.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }))
                 */
            /*
            .sheet(isPresented: $showSheet, content: {
            Text("modal sheet").background(Color.green)
            })
            */
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()//.environmentObject(StockData())
    }
}

extension TestView {
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 36)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.backgroundColor: UIColor.systemPink
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
