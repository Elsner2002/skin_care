//
//  ProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 26/07/23.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var vm = CloudKitModel()

    let product: ListProduct
    
    var body: some View {
        VStack {
            Text(String(product.barcode))
        }
//        .navigationBarBackButtonHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button {
//                    path = []
//                } label: {
//                    HStack {
//                        Image(systemName: "chevron.backward")
//                        Text("Back")
//                    }
//                }
//                
//            }
//        }
    }
}
