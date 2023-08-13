//
//  CategoryVerticalView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 12/08/23.
//

import SwiftUI

struct CategoryVerticalView: View {
    @StateObject var vm = CloudKitModel()
    var searchText: String
    var listOfProducts: [ListProduct]
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                ForEach(listOfProducts.filter({searchText.isEmpty ? true : ($0.name.uppercased().contains(searchText.uppercased())) || ($0.brand.uppercased().contains(searchText.uppercased()))}), id: \.self) {
                    product in

                    NavigationLink {
                        ProductView(product: product, addRoutine: false)
                    } label: {
                        ButtonProductList(product: product)
                    }
                }
            }
        }
    }
}

struct CategoryVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryVerticalView(searchText: "", listOfProducts: [])
    }
}
