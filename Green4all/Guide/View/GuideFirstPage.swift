//
//  GuideFirstPage.swift
//  Green4all
//
//  Created by emm on 18/03/2021.
//

import SwiftUI



//MARK: - /////////////////////    \\\\\\\\\\\\\\\\\\\\\\\

//struct GuideFirstPage: View {
//    var body: some View {
//        VStack {
//            Grid(categ1: CategoDummieData())
//        }
//    }
//}




//MARK: - /////////////////////    \\\\\\\\\\\\\\\\\\\\\\\

struct Grid: View {
//    var categ: CategoDummieData
//
   
//    var guideI:[String] = ["i1","i2","i3","i4","i5","i6","i7","i8"]
     
    var body: some View {
       
        let col = [
            GridItem(.flexible()),
            GridItem(.flexible())
                     
        ]
        
        //bavigation bar title change font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //change color
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
        
     
            
        return NavigationView {
            
            VStack(alignment: .leading) {
                Text("Categories")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 100)
                    .padding(.leading, 28)
                    
                    
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: col) {
                        
                        
                            
                        
                        ForEach(categorieData) { data in
                                VStack {
                                    NavigationLink(
                                        destination: GuideDetail1(categ: data),
                                        label: {
                                            Image(data.image)
                                                .resizable()
                                                .scaledToFill()
                                        })
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 8)
                            }
                        
                        
                    }
                
            
            .padding(.top, 30)
            .padding(.horizontal)
        }
        
        .background(Color("bgGreen").edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        
        
            }
            .background(Color("bgGreen"))
            .ignoresSafeArea(.all)
            
        
        }
        .navigationBarHidden(true)
        .accentColor( .white)
        
        
       
    }
}




//MARK: - /////////////////////    \\\\\\\\\\\\\\\\\\\\\\\

//struct GuideFirstPage_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
