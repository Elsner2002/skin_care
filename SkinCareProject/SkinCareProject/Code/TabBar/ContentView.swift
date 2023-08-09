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
            HomeView()
                .tabItem {
                    Image("routinesSymbol")
                    Text("Rotinas")
                }
            ProductListView()
                .tabItem {
                    Image("productSymbol")
                    Text("Produtos")
                }
            
            JournalView()
                .tabItem {
                    Label("Diario", systemImage: "note.text")
                }
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
        .accentColor(Color.brandGreen)

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
