//
//  VerticalScrollProductsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 08/08/23.
//

import SwiftUI

struct VerticalScrollProductsView: View {
    
    @StateObject private var vm = CloudKitModel()
    var searchText: String
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
//                ForEach(vm.listProducts.filter({_ in vm.listProducts.contains(where: {$0.name.compare(searchText, options: .caseInsensitive) == .orderedSame})}), id: \.self) { product in
//                    NavigationLink {
//                        ProductView(product: product)
//                    } label: {
//                        ButtonProductList(product: product)
//                    }
//                }
                ForEach(vm.listProducts.filter({searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.self) { product in
                    NavigationLink {
                        ProductView(product: product)
                    } label: {
                        ButtonProductList(product: product)
                    }
                }
            }
        }
    }
}

struct VerticalScrollProductsView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScrollProductsView(searchText: "")
    }
}
