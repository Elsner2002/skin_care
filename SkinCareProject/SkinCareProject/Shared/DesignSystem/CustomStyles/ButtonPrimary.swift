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
    
    var backgroundColor: Color
    var cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.body)
            .padding()
            .background(self.backgroundColor)
            .cornerRadius(12)
    
    }
}

struct ButtonPrimary_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                          print("Button was tapped")
                      } label: {
                          Text("Button label")
                      }
                      .buttonStyle(ButtonPrimary(backgroundColor: .buttonColor, cornerRadius: 12))
        }
    }
}

