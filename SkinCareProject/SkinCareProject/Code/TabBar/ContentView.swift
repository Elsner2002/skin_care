//
//  ContentView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //TabBarQuest()
        TabView{
            HomeView()
                .tabItem {
                    Image("routinesSymbol")
                    Text("Rotinas")
                }
                .tag(0)
            ProductListView()
                .tabItem {
                    Image("productSymbol")
                    Text("Produtos")
                }
                .tag(1)
            DiaryView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Diario")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }
                .tag(3)
        }
        .accentColor(Color.brandGreen)
        .onAppear{
            UITabBar.appearance().backgroundColor = UIColor(Color.systemBG)
        }

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
