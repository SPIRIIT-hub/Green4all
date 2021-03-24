//
//  GuideDetail1.swift
//  Green4all
//
//  Created by emm on 19/03/2021.
//

import SwiftUI

struct GuideDetail1: View {
    
    @State var searchQuery = ""
    
    var categ: CategoDummieData

    var body: some View {
        ZStack(alignment: .top){
            VStack {
                
                ///////////////////////// title \\\\\\\\\\\\\\\\\\\\\\\
                VStack(alignment: .center) {
                    HStack {
                        
                            (
                                Text(categ.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                +
                                    Text(" \(categ.title2)")
                                .foregroundColor(.white)
                            )
                            .font(.largeTitle)
                            .padding()

                           
                     
                    }
                    .offset(y: -110)
                    .padding(.leading, 05)
                }
 
                ///////////////////////// search bar \\\\\\\\\\\\\\\\\\\\\\\
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 23, weight: .medium))
                            .foregroundColor(Color("bgGreen"))
                        
                    
                        TextField("Recherche", text: $searchQuery)
                            .accentColor(Color("bgGreen"))
                           
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white).opacity(0.7)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                }
                .offset(y: -110)

            }

            
            
            ///////////////////////// scroll view \\\\\\\\\\\\\\\\\\\\\\\
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    ForEach(categ.data) { card in
                        
                        NavigationLink (
                            destination: DetailOfDetail(categoDetail: card ),
                            label: {
                        CardRow(forCard: card)
                            }).accentColor(.gray)
                    }
                    .navigationBarTitle("")
                    
                    
//                    ForEach(categorieData) { data in
//                            VStack {
//                                NavigationLink(
//                                    destination: GuideDetail1(categ: data),
//                                    label: {
//                                        Image(data.image)
//                                            .resizable()
//                                            .scaledToFill()
//                                    })
//                            }
//                            .padding(.horizontal, 10)
//                            .padding(.vertical, 8)
//                        }
                    

                    
                }
                .padding(.top, 10)

            }).padding(.top, 30)
        }
        
        
        .background(Color("bgGreen").ignoresSafeArea(.all))
        
    }
}

//struct GuideDetail1_Previews: PreviewProvider {
//    static var previews: some View {
//        GuideDetail1()
//    }
//}
