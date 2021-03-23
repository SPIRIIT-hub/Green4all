//
//  ProfilCreate.swift
//  Green4all
//
//  Created by Bachir SAHALI on 23/03/2021.
//

import SwiftUI

struct ProfilCreate: View {
    
    @State var mail: String = ""
    @State var password: String = ""
    @State var lastname: String = ""
    @State var firstname: String = ""
    
    
    init(){
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().largeTitleTextAttributes =
            [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Color("bgGreen")
                    .ignoresSafeArea()
                VStack{
                    Form {
                        Section{
                            TextField("Nom", text: $lastname)
                        }
                        Section{
                            TextField("Prénom", text: $firstname)
                        }
                        Section{
                            TextField("Émail", text: $mail)
                        }
                        Section{
                            TextField("Mot de Passe", text: $password)
                        }
                    }
                }.onAppear{
                    UITableView.appearance().backgroundColor = .clear
                }
            }
            .navigationBarTitle("Créer un compte" , displayMode: .inline)        }
    }
}

struct ProfilCreate_Previews: PreviewProvider {
    static var previews: some View {
        ProfilCreate()
    }
}
