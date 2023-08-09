//
//  VerticalScrollProductsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 08/08/23.
//

import SwiftUI

struct VerticalScrollProductsView: View {
    
    @StateObject private var vm = CloudKitModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                ForEach(vm.listProducts, id: \.self) { product in
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
        VerticalScrollProductsView()
    }
}
