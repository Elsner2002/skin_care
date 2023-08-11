//
//  ProductButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct ProductButton: View {
    
    var product: ListProduct
    
    var body: some View {
        NavigationLink {
            ProductView(product: product)
        } label: {
            ZStack{
                if let url = product.image, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                    Image(uiImage: imageProduct)
                        .resizable()
                        .frame(width: 96, height: 133)
                        .cornerRadius(15, corners: [.topLeft, .bottomRight])
                }
                VStack{
                    Text(product.brand)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(product.name)
                        .bold()
                        .foregroundColor(.black)
                }
                .scaledToFit()
                .frame(width: 96, alignment: .leading)
                .background(Color.brandWhite)
                .cornerRadius(15, corners: [.topLeft, .bottomRight])
                .offset(y: 55)
            }
        }
        
    }
}

struct ProductButton_Previews: PreviewProvider {
    static var previews: some View {
        ProductButton(product: ListProduct(image: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), name: "Niacinamida", nickname: "Niacinamida", explanation: "", brand: "Simple Organic", recomendedTime: [], vegan: true, barcode: 123, priceRange: 100, SPF: 1, texture: "", ingredients: [], categories: [])!)
    }
}
