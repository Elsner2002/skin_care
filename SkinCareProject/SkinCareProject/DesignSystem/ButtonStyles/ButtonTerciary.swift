//
//  ButtonTerciary.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 03/08/23.
//

import Foundation
import SwiftUI
import UIKit

struct ButtonTerciary: ButtonStyle {
    let unpressedColor = Color.buttonColor
    let pressedColor = Color.systemButton
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(configuration.isPressed ? pressedColor : unpressedColor)
            .cornerRadius(12)

    }
}

struct ButtonTerciary_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                          print("Button was tapped")
                      } label: {
                          Text("Button label")
                      }
                      .buttonStyle(ButtonTerciary())
        }
    }
}

