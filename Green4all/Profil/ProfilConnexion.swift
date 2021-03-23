//
//  ProfilConnexion.swift
//  Green4all
//
//  Created by Bachir SAHALI on 18/03/2021.
//

import SwiftUI

struct ProfilConnexion: View {
    
    @State var mail: String = ""
    @State var password: String = ""
    
    
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
                            TextField("Émail", text: $mail)
                        }
                        Section{
                            SecureField("Mot de Passe", text: $password)
                            
                        }
                        
                    }
                    .foregroundColor(Color("bgDarkGreen"))
                    .frame(maxHeight: 170)
                    .onAppear{
                        UITableView.appearance().backgroundColor = .clear
                    }
                     
                    VStack( spacing: 100){
                        
                        Button(action: {}, label: {
                            Text("Mot de Passe oublié ?")
                                .fontWeight(.bold)
                        })
                        
                        
                        Button(action: {}, label: {
                            Text("Se Connecter")
                                .fontWeight(.bold)
                        })
                        .padding(.horizontal, 100)
                        .padding()
                        .background(Color("bgDarkGreen"))
                        .cornerRadius(10)
                        
                        Button(action: {}, label: {
                            HStack {
                                Text("Pas de compte ?" )
                                Text("Inscrivez-vous")
                                    .fontWeight(.bold)
                            }
                        })
                    }
                    
                }
                
            }
            .foregroundColor(.white)
            .navigationBarTitle("Connexion" , displayMode: .large)
            
        }
        
    }}

struct ProfilConnexion_Previews: PreviewProvider {
    static var previews: some View {
        ProfilConnexion()
    }
}
