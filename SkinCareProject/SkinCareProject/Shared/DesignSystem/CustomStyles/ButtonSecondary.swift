//
//  ButtonPrimary.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 01/08/23.
//

import Foundation
import SwiftUI
import UIKit

struct ButtonSecondary: ButtonStyle {
    
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.title3)
            .padding()
            .background(self.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .inset(by: 0.5)
                    .stroke(Color.systemLabelPrimary, lineWidth: 1)
            )
    }
}

struct ButtonSecondary_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                print("Button was tapped")
            } label: {
                Text("Button label")
            }
            .buttonStyle(ButtonSecondary(backgroundColor: .white))
        }
    }
}


