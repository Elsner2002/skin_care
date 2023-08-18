//
//  CreateProductTextField.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 02/08/23.
//

import SwiftUI

struct CreateProductTextField: View {
    
    @Binding var productName: String
    var title: String
    var subTitle: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text(title)
                .font(Font.custom("SF Pro", size: 17))
                .foregroundColor(Color.systemLabelPrimary)
                .frame(width: 100, height: 42, alignment: .center)
            TextField(subTitle, text: $productName)
                .foregroundColor(Color.systemLabelPrimary)
                .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.systemMaterialSecondary)
                .shadow(color: Color.gray.opacity(0.15), radius: 10, x: 0, y: 0)
        )
    }
}

struct CreateProductTextField_Previews: PreviewProvider {
    static var previews: some View {
        CreateProductTextField(productName: .constant(""), title: "Nome", subTitle: "Nome do produto")
    }
}
