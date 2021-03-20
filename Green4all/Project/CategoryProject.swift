//
//  Category.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import Foundation

enum CategoryProject : CaseIterable {
    case energie, batiment, transport, none
    
    var categoryProjectTitle : String {
        switch self {
        case .energie: return "Enérgie"
        case .batiment: return "Batiment"
        case .transport: return "Transport"
        case .none: return "none"
        }
    }
    
    var categoryProjectImage : String {
        switch self {
        case .energie: return "energie"
        case .batiment: return "batiment"
        case .transport: return "transport"
        case .none: return "none"
        }
    }
}
