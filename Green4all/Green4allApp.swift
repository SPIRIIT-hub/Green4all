//
//  Green4allApp.swift
//  Green4all
//
//  Created by Baptiste Moulin on 18/03/2021.
//

import SwiftUI

@main
struct Green4allApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)

        }
    }
}
