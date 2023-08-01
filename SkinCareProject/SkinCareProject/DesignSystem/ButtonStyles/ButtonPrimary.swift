//
//  ButtonPrimary.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 01/08/23.
//

import Foundation
import SwiftUI
import UIKit

struct ButtonPrimary: ButtonStyle {
    
    
    let unpressedColor = Color.systemMaterial
    let pressedColor = Color.systemButton
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .background(configuration.isPressed ? pressedColor : unpressedColor)
            .cornerRadius(12)
    
    }
}

struct ButtonPrimary_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                          print("Button was tapped")
                      } label: {
                          Text("Button label")
                      }
                      .buttonStyle(ButtonPrimary())
        }
    }
}
