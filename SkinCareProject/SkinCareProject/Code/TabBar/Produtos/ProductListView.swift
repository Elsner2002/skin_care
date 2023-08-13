//
//  ProductListView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 21/07/23.
//

import SwiftUI

struct ProductListView: View {
    
    @State private var searchText = ""
    
    @StateObject var vm = CloudKitModel()
    @State var categoryButtons = ProductCategory.allCases
    @State var selectedCategory: ProductCategory?
    
    var body: some View {
        NavigationStack {
            VStack{
                Searchbar(searchText: $searchText, showCreateProduct: false, addRoutine: false)
                
                if searchText.isEmpty {
                    ScrollView(showsIndicators: false) {
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach(categoryButtons, id: \.self) { category in
                                    CategoryButton(
                                        selectedButton: category == selectedCategory,
                                        image: Image(category.rawValue),
                                        label: category.rawValue) {
                                            if let selectedCategory, selectedCategory == category {
                                                self.selectedCategory = nil
                                            }
                                            else {
                                                selectedCategory = category
                                            }
                                        }
                                }
                                .padding(.trailing)
                            }
                            .padding()
                        }
                        .padding(.horizontal, 15)
                        
                        if let selectedCategory {
                            CategoryVerticalView(searchText: searchText, listOfProducts: Constants.shared.filter(category: selectedCategory, productList: vm.listProducts))
                        }
                        else {
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
                                    AllProductsListView(addRoutine: false)
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
                else {
                    VerticalScrollProductsView(searchText: searchText, addRoutine: false)
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
