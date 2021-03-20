//
//  SearchBar.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText:String
    
    @State private var isEditing : Bool = false
    
    var body: some View {
        HStack {
            TextField("Rechercher ...", text: $searchText)
                .disableAutocorrection(true)
                .padding(8)
                .padding(.horizontal, 25)
                .foregroundColor(Color("greenSearchBar"))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray4))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            clearButton
                        }
                    }
                )
                
                .onChange(of: searchText , perform: { value in
                    self.isEditing = (searchText != "")
                })
        }
        .background(Color.white.opacity(0.9))
        .cornerRadius(5.0)
        .padding(.horizontal) 
    }
}

extension SearchBar {
    
    private var clearButton : some View {
        Button(action: {
            self.isEditing = false
            self.searchText = ""
        }) {
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(Color(.systemGray4))
                .padding(8)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
