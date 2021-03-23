//
//  ContentView.swift
//  Green4all
//
//  Created by Baptiste Moulin on 18/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Market()
        MarketList() //page principal yoko
        //TestView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())

    }
}
