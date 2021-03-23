//
//  CardRow.swift
//  Green4all
//
//  Created by emm on 19/03/2021.
//

import SwiftUI

struct CardRow: View {
    var forCard: GuideModel
    
    var body: some View {
        HStack(spacing: 15) {
            
            Image(forCard.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 140, maxHeight: 140)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(forCard.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(forCard.detail)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        .background(Color.white)
        
        .cornerRadius(12)
        .padding(.horizontal)
        
    }
    
    
    
    
}

//struct CardRow_Previews: PreviewProvider {
//    static var previews: some View {
////        CardRow(forCard: GuideModel(image: "p1", title: "Finance verte", detail: "orienter les investissements vers des activités durables et émettant peu de gaz à effet de serre", text: ""))
//        GuideDetail1(categ: CategoDummieData)
//    }
//}
