//
//  HorizontalScrollProductsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 08/08/23.
//

import SwiftUI

struct HorizontalScrollProductsView: View {
    
    @StateObject private var vm = CloudKitModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.listProducts, id: \.self) { product in
                    
                    ProductButton(product: product)
                    
                }
                
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.brandWhite)
                .shadow(
                    color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                )
        )
        .padding([.leading, .trailing], 15)
        
    }
}

struct HorizontalScrollProductsView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollProductsView()
    }
}
