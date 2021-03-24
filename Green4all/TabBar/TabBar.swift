//
//  TabBar.swift
//  Green4all
//
//  Created by emm on 18/03/2021.
//

import SwiftUI






//MARK: - /////////////  TabBar  \\\\\\\\\\\\\

var tabItems = ["Project", "Guide","Market","Profil"]

struct TabBar: View {
    @State var selected = "guide"
    
    init() {
        UITabBar.appearance().isHidden = true
        UITableView.appearance().backgroundColor = .green // Uses UIColor
    }
    
    @State var centerX : CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 0) {
            TabView(selection: $selected) {
                
                Text("inserer Market ici")
                    .tag(tabItems[0])
                
                Grid()
                    .tag(tabItems[1])
                
                Text("inserer Market ici")
                    .tag(tabItems[2])
                
                Text("inserer Profile ici")
                    .tag(tabItems[3])
            }
            
            //personaliser la tabbar ...
            HStack(spacing: 0){
                ForEach(tabItems, id: \.self) { value in
                    GeometryReader { reader in
                        TabBarButton(selected: $selected, value: value, centerX: $centerX, rect: reader.frame(in: .global))
                        // setting First initial Curve...
                            .onAppear(perform: {
                                centerX = reader.frame(in: .global).midX
                            })
                        
                    }
                    .frame(width: 70, height: 50)
                    
                    if value != tabItems.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal, 25)
            .padding(.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white.clipShape(AnimatedShape(centerX: centerX)))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5 )
            .padding(.top, -15)
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}


//MARK: - /////////////  TabBarButton  \\\\\\\\\\\\\

struct TabBarButton: View {
    
    @Binding var selected: String
    var value: String
    @Binding var centerX: CGFloat
    var rect: CGRect
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = value
                centerX = rect.midX
            }
        }, label: {
            VStack {
                
                Image(value)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 35, height: 35)
                    .foregroundColor(selected == value ? Color("bgGreen") : .gray)
                
                Text(value)
                    .font(.caption)
                    .foregroundColor(Color("bgGreen"))
                    .opacity(selected == value ? 1 : 0)
            }
            .padding(.top)
            .frame(width: 70, height: 50)
            .offset(y: selected == value ? -15 : 0)
        })
    }
}



//MARK: - /////////////  AnimatedShape  \\\\\\\\\\\\\

struct AnimatedShape: Shape {
    
    var centerX: CGFloat
    
    // animation
    var animatableData: CGFloat {
        get {return centerX}
        set {centerX = newValue}
    }
    
    func path(in rect: CGRect)-> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 15))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 15))
            
            // curve ...
            path.move(to: CGPoint(x: centerX - 35, y: 15))
            path.addQuadCurve(to: CGPoint(x: centerX + 35, y: 15), control: CGPoint(x: centerX, y: -30))
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
