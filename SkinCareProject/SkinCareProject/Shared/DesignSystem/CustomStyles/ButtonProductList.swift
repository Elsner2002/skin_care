//
//  ButtonProductList.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 03/08/23.
//

import SwiftUI

struct ButtonProductList: View {
    
    var product: ListProduct
    
    var body: some View {
        HStack{
            if let url = product.image, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                Image(uiImage: imageProduct)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
            }
            
            VStack{
                HStack{
                    Text(product.nickname)
                        .font(
                        Font.custom("SF Pro Text", size: 15)
                        .weight(.bold)
                        )
                        .foregroundColor(Color.systemLabelPrimary)
                    Spacer()
                    Text(product.brand)
                        .font(
                        Font.custom("SF Pro Text", size: 15)
                        .weight(.bold)
                        )
                        .foregroundColor(Color.systemLabelPrimary)
                } .lineLimit(1)
                    .padding(.bottom, 2)
                HStack{
                    Text(product.categories[0])
                        .font(
                        Font.custom("SF Pro Text", size: 15)
                        .weight(.medium)
                        )
                        .foregroundColor(Color.systemLabelSecondary)
                    Text(Constants.shared.priceRange(price: product.priceRange))
                        .font(
                        Font.custom("SF Pro Text", size: 15)
                        .weight(.medium)
                        )
                        .foregroundColor(Color.systemLabelTerciary)
                    Spacer()
                }
            }
            Spacer()
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.systemMaterialSecondary)
                .shadow(
                    color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                )
        )
        .padding(.horizontal)
    }
}

struct ButtonProductList_Previews: PreviewProvider {
    static var previews: some View {
        ButtonProductList(product: ListProduct(image: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), name: "Niacinamida", nickname: "Niacinamida", explanation: "", brand: "Simple Organic", recomendedTime: [], vegan: true, barcode: 123, priceRange: 100, SPF: 1, texture: "", ingredients: [], categories: [])!)
    }
}
