//
//  CategoryVerticalView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 12/08/23.
//

import SwiftUI

struct CategoryVerticalView: View {
    @StateObject var vm = CloudKitModel()
    var listOfProducts: [ListProduct]
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<(listOfProducts.count)/2, id: \.self) {position in
                        ProductButton(product: listOfProducts[position])
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 25)
                .padding(.bottom, 34)
                
                HStack{
                    ForEach((listOfProducts.count)/2..<listOfProducts.count, id: \.self) {position in
                        ProductButton(product: listOfProducts[position])
                    }
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 25)
            }
            .padding(.horizontal, 15)
        }
    }
}

struct CategoryVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryVerticalView(listOfProducts: [])
    }
}
