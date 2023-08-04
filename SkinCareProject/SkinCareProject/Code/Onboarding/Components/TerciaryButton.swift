//
//  ButtonTerciary.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI


struct buttonModel {
    func saveGender() {
        print("saved")
    }
}

struct TerciaryButton: View {
    var label: String
    var description: String

    var body: some View {
        Button {
            print(label)
        } label: {
            Text(label)
            .frame(width: 271, alignment: .center)

        }
        .buttonPrimary()
        
    }
}

struct TerciaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(label: "Pele Normal", description: "texto sobre como a pele normal se categoriza linha linha linha linahakbf", action: {})
    }
}
