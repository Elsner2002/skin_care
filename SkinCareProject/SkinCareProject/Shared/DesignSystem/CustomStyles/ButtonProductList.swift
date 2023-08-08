//
//  ButtonProductList.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 03/08/23.
//

import SwiftUI

struct ButtonProductList: View {
    
    var name: String
    var brand: String
    var price: Int
    var image: Image
    
    var body: some View {
        HStack{
            image
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack{
                HStack{
                    Text(name)
                        .foregroundColor(Color.systemLabelPrimary)
                    Text(Constants.shared.priceRange(price: price))
                        .foregroundColor(Color.systemLabelPrimary)
                    Spacer()
                }
                .padding(.bottom, 2)
                HStack{
                    Text(brand)
                        .foregroundColor(Color.systemLabelSecondary)
                    Spacer()
                }
            }
            Spacer()
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brandWhite)
                .shadow(
                    color: Color.brandGray.opacity(0.15), radius: 10, x: 0, y: 0
                )
        )
        .padding([.leading, .trailing])
    }
}

struct ButtonProductList_Previews: PreviewProvider {
    static var previews: some View {
        ButtonProductList(name: "Niacinamida", brand: "Simple Organic", price: 100, image: Image("ProfileDefault"))
    }
}
