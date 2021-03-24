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
                .frame(maxWidth: 125, maxHeight: 125)
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text(forCard.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, -3)
                Text(forCard.detail)
                    .font(.footnote)
                    .foregroundColor(.black)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        .background(Color.white.opacity(0.9))
        
        .cornerRadius(12)
        .padding(.horizontal)
        
    }
    
    
    
    
}

//struct CardRow_Previews: PreviewProvider {
//    static var previews: some View {
////        CardRow(forCard: GuideModel(image: "p1", title: "Finance verte", detail: "orienter les investissements vers des activités durables et émettant peu de gaz à effet de serre", text: ""))
//        CardRow(forCard: GuideM, categ: <#CategoDummieData#>odel(image: "p3", title: "Obligation verte", detail: "les obligations vertes sont des emprunts émis pour financer des projets « verts »", text: "Lore"))
//    }
//}
