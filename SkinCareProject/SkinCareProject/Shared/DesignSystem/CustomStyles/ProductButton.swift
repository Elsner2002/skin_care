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
            ProductView(product: product, addRoutine: false)
        } label: {
            ZStack{
                if let url = product.image, let data =  try? Data(contentsOf: url),  let imageProduct = UIImage(data: data) {
                    Image(uiImage: imageProduct)
                        .resizable()
                        .frame(width: 105, height: 150)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.07), radius: 0, x: 4, y: 4)
                }
                VStack{
                    Text(product.nickname)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(
                        Font.custom("SF Pro", size: 12)
                            .weight(.medium)
                        )
                        .foregroundColor(Color.systemLabelPrimary)
                        .frame(width: 86, height: 26, alignment: .topLeading)
                        .padding([.leading, .top], 10)
                    
                    HStack{
                        Text(product.brand)
                            .font(Font.custom("SF Pro", size: 10))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.systemLabelSecondary)
                        Spacer()
                    }
                    .padding([.leading, .bottom], 10)
                }
                .scaledToFit()
                .frame(width: 105, alignment: .leading)
                .background(Color.systemMaterialSecondary)
                .cornerRadius(15, corners: [.topLeft, .bottomRight])
                .offset(y: 40)
                .padding(.horizontal, 7)
            }
            .ignoresSafeArea()
        }
        
    }
}

struct ProductButton_Previews: PreviewProvider {
    static var previews: some View {
        ProductButton(product: ListProduct(image: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), name: "Niacinamida", nickname: "Niacinamida", explanation: "", brand: "Simple Organic", recomendedTime: [""], vegan: true, barcode: 123, priceRange: 100, SPF: 1, texture: "", ingredients: [""], categories: [""])!)
    }
}
