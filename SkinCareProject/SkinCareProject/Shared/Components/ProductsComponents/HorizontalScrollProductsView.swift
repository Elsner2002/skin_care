//
//  HorizontalScrollProductsView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 08/08/23.
//

import SwiftUI

struct HorizontalScrollProductsView: View {
    
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
//                .background(
//                    RoundedRectangle(cornerRadius: 25)
//                        .fill(Color.systemBG)
//                        .shadow(
//                            color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
//                        )
//                )
            }
            .padding(.horizontal, 15)
        }
    }
}

struct HorizontalScrollProductsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HorizontalScrollProductsView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            HorizontalScrollProductsView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
    }
}
