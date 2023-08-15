//
//  AboutProductView.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 09/08/23.
//

import SwiftUI

struct AboutProductView: View {
    
    var product: ListProduct
    var addRoutine: Bool
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
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
                    
                    Text(product.explanation)
                        .padding(.leading, 32)
                        .padding(.trailing, 18)
                        .padding(.vertical, 24)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(product.categories, id: \.self) { categorie in
                                VStack{
                                    Image(categorie)
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                    Text(categorie)
                                        .bold()
                                        .foregroundColor(Color.brandGray)
                                }
                                .padding(.horizontal, 10)
                            }
                            
                            if product.vegan {
                                VStack{
                                    Image("Vegan")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                    Text("vegano")
                                        .bold()
                                        .foregroundColor(Color.brandGray)
                                }
                                .padding(.horizontal, 10)
                            }
                            
                        }
                        .padding(.horizontal, 12)
                    }
                    
                    if addRoutine {
                        CustomButton(label: "Adicionar a minha rotina", action: {}, description: "", buttonType: .largeRounded)
                            .padding(.top, 18)
                            .padding(.horizontal, 30)
                    }
                }
            }
        }
    }
}

struct AboutProductView_Previews: PreviewProvider {
    static var previews: some View {
        AboutProductView(product: ListProduct(image: CloudKitUtility.makeURLJPG(image: "ProfileDefault"), name: "Niacinamida", nickname: "Niacinamida", explanation: "", brand: "Simple Organic", recomendedTime: [""], vegan: true, barcode: 123, priceRange: 100, SPF: 1, texture: "", ingredients: [""], categories: [""])!, addRoutine: true)
    }
}
