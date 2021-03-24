//
//  ContributionView.swift
//  Green4all
//
//  Created by Bachir SAHALI on 24/03/2021.
//

import SwiftUI

struct ContributionView: View {
    
    @State var amount:Int64 = 0
    
    var body: some View {
        
        // Permet de supprimer la couleur du background par defaut
        UITableView.appearance().backgroundColor = .clear
        
        // Met un background color
        UINavigationBar.appearance().backgroundColor = UIColor(Color("bgGreen"))
        
        // Couleur et fontWeight du titre de la NavBar
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor(Color.white),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        // Couleur de la navBarItems
        UINavigationBar.appearance().tintColor = .white
        
        // Couleur du background de la navBar
        UINavigationBar.appearance().barTintColor = UIColor(Color("bgGreen"))
        
        // Passer a false si on ne veut que la couleur de la navBar soit translucide
        //UINavigationBar.appearance().isTranslucent = false
        
        return
            NavigationView{
                ZStack {
                    Color("bgGreen").ignoresSafeArea()
                    
                    VStack(alignment: .center) {
                        Spacer()
                        HStack {
                            Text("Quel est le montant de votre contribution ?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        Form {
                            
                            TextField("Montant", value: $amount, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                        } .frame(maxHeight: 150)
                        
                        Button(action: {}, label: {
                            Text("Payer")
                                .fontWeight(.bold)
                        })
                        .padding(.horizontal, 135)
                        .padding()
                        .background(Color("bgDarkGreen"))
                        .cornerRadius(10)
                        Spacer()
                        //                }.frame(maxWidth: 200, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        //
                        //                HStack {
                        //                    Spacer()
                        //                    Button("Annuler") {
                        //                       showContributionView = false
                        //                    }
                        //                    .font(.title)
                        //                    .frame(width: 100)
                        //                    .padding(8.0)
                        //                    .background(Color.white)
                        //                    .cornerRadius(8)
                        //
                        //                    Spacer()
                        //
                        //                    Button("Valider") {
                        //                        saveAmount()
                        //                       showContributionView = false
                        //                    }
                        //                    .font(.title)
                        //                    .frame(width: 100)
                        //                    .padding(8.0)
                        //                    .background(Color.white)
                        //                    .cornerRadius(8)
                        //
                        //                    Spacer()
                        //
                        //                }.foregroundColor(Color("greenSearchBar"))
                    }
                }
                .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "multiply")
                        .font( .system(size: 25))
                }))
                
           
            }.foregroundColor(.white)
    }
}


struct ContributionView_Previews: PreviewProvider {
    static var previews: some View {
        ContributionView()
    }
}
