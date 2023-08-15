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
            //varias fileiras de 3 na horizontal
            VStack(alignment: .leading){
                ForEach(0..<((listOfProducts.count)/3)+1) { position in
                    HStack {
                        if listOfProducts.count>(position*3){
                            ProductButton(product: listOfProducts[position*3])
                            if listOfProducts.count>(position*3)+1 {
                                ProductButton(product: listOfProducts[(position*3)+1])
                                    .padding(.horizontal, 25)
                                if listOfProducts.count>(position*3)+2 {
                                    ProductButton(product: listOfProducts[(position*3)+2])
                                }
                            }
                        }
                    }
                    .padding(.bottom, 25)
                }
            }
            .padding([.horizontal, .top], 22)
            
            //tres fileiras na vertical
//            HStack {
//                VStack{
//                    ForEach(0..<(listOfProducts.count)/3) { position in
//                        ProductButton(product: listOfProducts[position])
//                            .padding(.bottom, 25)
//                    }
//                }
//                VStack{
//                    ForEach((listOfProducts.count)/3..<(2*listOfProducts.count)/3) { position in
//                        ProductButton(product: listOfProducts[position])
//                            .padding(.bottom, 25)
//                    }
//                }
//                .padding(.horizontal, 25)
//                VStack{
//                    ForEach((2*listOfProducts.count)/3..<listOfProducts.count) { position in
//                        ProductButton(product: listOfProducts[position])
//                            .padding(.bottom, 25)
//                    }
//                }
//            }
//            .padding(.horizontal, 22)
//            .padding(.top, 29)
            
            //duas fileiras na horizontal
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack{
//                    ForEach(0..<(listOfProducts.count)/2, id: \.self) {position in
//                        ProductButton(product: listOfProducts[position])
//                    }
//                }
//                .padding(.horizontal, 15)
//                .padding(.top, 25)
//                .padding(.bottom, 34)
//
//                HStack{
//                    ForEach((listOfProducts.count)/2..<listOfProducts.count, id: \.self) {position in
//                        ProductButton(product: listOfProducts[position])
//                    }
//                }
//                .padding(.horizontal, 15)
//                .padding(.bottom, 25)
//            }
//            .padding(.horizontal, 15)
        }
    }
}

struct CategoryVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryVerticalView(listOfProducts: [])
    }
}
