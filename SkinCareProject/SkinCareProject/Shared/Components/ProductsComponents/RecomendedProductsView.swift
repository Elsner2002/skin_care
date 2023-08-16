//
//  RecomendedProductsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 12/08/23.
//

import SwiftUI

struct RecomendedProductsView: View {
    
    @EnvironmentObject var vm: CloudKitModel

    
    var body: some View {
        ZStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.listProducts.count >= 10 ? 0..<9 : 0..<vm.listProducts.count, id: \.self) { position in
                        ProductButton(product: vm.listProducts[position])
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.systemBG)
                        .shadow(
                            color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                        )
                )
            }
            .padding(.horizontal, 15)
        }
    }
}

struct RecomendedProductsView_Previews: PreviewProvider {
    static var previews: some View {
        RecomendedProductsView()
    }
}
