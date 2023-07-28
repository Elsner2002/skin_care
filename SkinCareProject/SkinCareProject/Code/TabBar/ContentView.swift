//
//  ContentView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProductListView()
                .tabItem {
                    Label("Produtos", systemImage: "list.bullet")
                }
            
            JournalView()
                .tabItem {
                    Label("Diario", systemImage: "text.book.closed")
                }
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
