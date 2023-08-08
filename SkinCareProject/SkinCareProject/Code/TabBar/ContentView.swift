//
//  ContentView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @State var downloadAmount = 80.0
        
        
        TabView{
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }

            ProductListView()
                .tabItem {
                    Image("productSymbol")
                    Text("Produtos")
                }
            
            HomeView()
                .tabItem {
                    Image("routinesSymbol")
                    Text("Rotinas")
                }

            DiaryView()
                .tabItem {
                    Label("Diario", systemImage: "note.text")
                }
        }
        .accentColor(Color.brandGreen)
        .toolbarBackground(Color.yellow, for: .tabBar)
    }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
