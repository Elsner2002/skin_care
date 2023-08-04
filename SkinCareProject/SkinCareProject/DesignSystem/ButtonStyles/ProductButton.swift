//
//  ProductButton.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct ProductButton: View {
    
    var image: Image
    var brand: String
    var name: String
    
    var body: some View {
        Button {
            //
        } label: {
            ZStack{
                image
                    .resizable()
                    .frame(width: 96, height: 133)
                    .cornerRadius(15, corners: [.topLeft, .bottomRight])
                VStack{
                    Text(brand)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(name)
                        .bold()
                        .foregroundColor(.black)
                }
                .scaledToFill()
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
        ProductButton(image: Image("ProfileDefault"), brand: "Simple Organic", name: "Niacinamida")
    }
}
