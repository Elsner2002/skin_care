//
//  ProductListView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct ProductListView: View {
    
    @State private var searchText = ""
    @State var categoryButtons: [(String, Bool)] = [
            (ProductCategory.moisturizer.rawValue, false),
            (ProductCategory.cleanser.rawValue, false),
            (ProductCategory.sunscreen.rawValue, false),
            (ProductCategory.treatment.rawValue, false)
    ]
    
    var body: some View {
        NavigationStack {
            VStack{
                Searchbar(searchText: $searchText)
                
                ScrollView(showsIndicators: false) {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0..<categoryButtons.count) { position in
                                CategoryButton(
                                    selectedButton: categoryButtons[position].1,
                                    image: Image(categoryButtons[position].0),
                                    label: categoryButtons[position].0)
                            }
                            .padding(.trailing)
                        }
                        .padding()
                    }
                    .padding(.horizontal, 15)
                    
                    HStack{
                        Text("Recomendados para seu tipo de pele")
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 15)
                    HorizontalScrollProductsView()
                    
                    HStack{
                        Text("Conheça Mais")
                            .bold()
                        Spacer()
                        NavigationLink {
                            AllProductsListView()
                        } label: {
                            Text("Ver Todos")
                                .foregroundColor(Color.brandGreen)
                        }

                    }
                    .padding(.horizontal, 15)
                    HorizontalScrollProductsView()
                    
                    HStack{
                        Text("Dica do Dia")
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 15)
                    //TipsView(tip: Constants.shared.randomTip!)
                }
            }
        }
            .navigationTitle("Lista de Produtos")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
