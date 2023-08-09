//
//  CustomButtonStyle.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    var buttonType: ButtonType
        
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .brandWhite : buttonType.labelColor)
            .padding()
            .background(configuration.isPressed ? Color.brandGreen : buttonType.primaryColor)
            .cornerRadius(12)
            .overlay(
                buttonType.overlay == true ? RoundedRectangle(cornerRadius: 8).stroke(Color.systemLabelSecondary, lineWidth: 2) : nil
            )
    }
}


