//
//  AllProductsListView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct AllProductsListView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Searchbar(searchText: $searchText)

                VerticalScrollProductsView()
            }
        }
        .navigationTitle("Todos os produtos")
    }
}

struct AllProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsListView()
    }
}
