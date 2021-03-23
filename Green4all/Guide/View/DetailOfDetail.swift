//
//  DetailOfDetail.swift
//  Green4all
//
//  Created by emm on 22/03/2021.
//

import SwiftUI

struct DetailOfDetail: View {
    
    var categoDetail: GuideModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                VStack(alignment: .center) {
                    HStack {
                        Text(categoDetail.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                    }
                    .offset(y: -110)
                    .padding(.leading, 05)
                }
                
                Image(categoDetail.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 353, height: 200, alignment: .center)
                    .cornerRadius(12)
                    .padding(.bottom, 30)
                    .offset(y: -90)
                    
                
               
                
                Text(categoDetail.text)
                    .foregroundColor(.white)
                    .font(.headline)
                    .offset(y: -90)
                
            }
            
        }
        
        
        .padding(.horizontal, 50)
        .background(Color("bgGreen").ignoresSafeArea(.all))
    }
    
    
    
}


//struct DetailOfDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailOfDetail()
//    }
//}
