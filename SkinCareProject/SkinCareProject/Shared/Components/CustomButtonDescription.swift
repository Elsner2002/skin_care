//
//  customButtonDescription.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 05/08/23.
//

import SwiftUI

struct CustomButtonDescription: View {
    var description: String
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 1, height: 71)
                .background(Color.systemButton)
            Text(description)
            Spacer()
        }
    }
}

struct customButtonDescription_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonDescription(description: "texto sobre como a pele normal se categoriza linha linha linha linahakbf")
    }
}
