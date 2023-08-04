//
//  ButtonWithText.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 02/08/23.
//

import SwiftUI


struct ButtonWithDescription: View {
    var label: String
    var description: String

    var body: some View {
        VStack {
            Button {
                print("\(label)")
            } label: {
                Text(label)
                .frame(width: 271, alignment: .center)

            }
            .buttonPrimary()
            HStack {
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 1, height: 71)
                .background(Color.systemButton)
                Text(description)
                Spacer()
            }

        }
        .padding(47)
        


    }
}

struct ButtonWithDescription_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithDescription(label: "Pele Normal", description: "texto sobre como a pele normal se categoriza linha linha linha linahakbf")
    }
}
