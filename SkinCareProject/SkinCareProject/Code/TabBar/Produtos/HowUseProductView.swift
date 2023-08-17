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
            .padding([.horizontal, .top], 22)
            
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
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    VStack{
                        Image(product.texture)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        Text(product.texture)
                            .bold()
                            .foregroundColor(Color.brandGray)
                    }
                    .padding(.horizontal, 10)
                    
                    if product.recomendedTime.count == 2 {
                        VStack{
                            Image("DiaENoite")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            Text("Dia e Noite")
                                .bold()
                                .foregroundColor(Color.brandGray)
                        }
                        .padding(.horizontal, 10)
                    }
                    else{
                        VStack{
                            Image(product.recomendedTime[0])
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            Text(product.recomendedTime[0])
                                .bold()
                                .foregroundColor(Color.brandGray)
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .padding(.horizontal, 12)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<(product.warnings?.count ?? 0)) { position in
                        if let warn = product.warnings?[position] {
                            Text("• \(warn)")
                                .font(
                                    Font.custom("SF Pro Text", size: 14)
                                        .weight(.medium)
                                )
                                .frame(maxWidth: .infinity, minHeight: 23, maxHeight: 23, alignment: .top)
                                .background(Color.brandPink)
                                .cornerRadius(12, corners: .allCorners)
                        }
                    }
                }
                .padding(.all, 20)
            }
        }
    }
}

struct HowUseProductView_Previews: PreviewProvider {
    static var previews: some View {
        HowUseProductView(product: ListProduct(image: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), name: "Niacinamida", nickname: "Niacinamida", explanation: "", brand: "Simple Organic", recomendedTime: [""], vegan: true, barcode: 123, priceRange: 100, SPF: 1, texture: "", ingredients: [""], categories: [""])!)
    }
}
