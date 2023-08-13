//
//  HowUseProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 09/08/23.
//

import SwiftUI

struct HowUseProductView: View {
    
    var product: ListProduct
    
    var body: some View {
        VStack {
            HStack {
                //mudar para nickname aqui ou nao?
                Text(product.name)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color.systemLabelPrimary)
                    .bold()
                Spacer(minLength: 8)
                Text(product.brand)
                    .foregroundColor(Color.systemLabelSecondary)
                Text(Constants.shared.priceRange(price: product.priceRange))
                    .foregroundColor(Color.systemLabelSecondary)
                Spacer()
            }
            .padding(.horizontal, 22)
            
//            VStack{
//                ForEach(0..<(product.conditions?.count ?? 0)) { position in
//                    VStack{
//                        //como colocar a lista de como usa produto?
//                    }
//                    .padding(.leading, 90)
//                    .padding(.trailing, 24)
//                }
//            }
//            .padding(.top, 60)
            
            HStack{
                ForEach(0..<(product.warnings?.count ?? 0)) { position in
//                    Text(product.warnings[position])
                }
            }
            .padding(.vertical, 20)
        }
    }
}

struct HowUseProductView_Previews: PreviewProvider {
    static var previews: some View {
        HowUseProductView(product: ListProduct(image: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), name: "Niacinamida", nickname: "Niacinamida", explanation: "", brand: "Simple Organic", recomendedTime: [""], vegan: true, barcode: 123, priceRange: 100, SPF: 1, texture: "", ingredients: [""], categories: [""])!)
    }
}
