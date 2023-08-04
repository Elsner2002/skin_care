//  ButtonSecondary.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 02/08/23.
//

import Foundation
import SwiftUI
import UIKit

struct ButtonSecondary: ButtonStyle {
    
    var backgroundColor: Color
    let unpressedColor = Color.brandWhite
    let pressedColor = Color.systemButton
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(configuration.isPressed ? pressedColor : unpressedColor)
            .cornerRadius(12)
            .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.systemLabelSecondary, lineWidth: 2)
            )
    }
}

struct ButtonSecondary_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                          print("Button was tapped")
                      } label: {
                          Text("Button label")
                      }
                      .buttonStyle(ButtonSecondary(backgroundColor: .brandWhite))
        }
    }
}

