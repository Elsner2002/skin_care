//
//  AllProductsListView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct AllProductsListView: View {
    
    @State private var searchText = ""
    var addRoutine: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Searchbar(searchText: $searchText, showCreateProduct: false, addRoutine: addRoutine)
                
                VerticalScrollProductsView(searchText: searchText, addRoutine: addRoutine)
            }
        }
        .navigationTitle("Todos os produtos")
    }
}

struct AllProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsListView(addRoutine: true)
    }
}
