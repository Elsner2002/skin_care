//
//  ButtonTerciary.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI


struct TerciaryButton: View {
    var label: String
    var description: String
    var action: () -> Void

    var body: some View {
        Button {
            
        } label: {
            Text(label)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .center)

        }
        .buttonTerciary()
        
    }
}

struct TerciaryButton_Previews: PreviewProvider {
    static var previews: some View {
        TerciaryButton(label: "Pele Normal", description: "texto sobre como a pele normal se categoriza linha linha linha linahakbf", action: {})
    }
}
