//
//  ButtonExtension.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 01/08/23.
//


import Foundation
import SwiftUI

extension Button {
    func customButtonStyle(buttonType: ButtonType) -> some View {
        self.buttonStyle(CustomButtonStyle(buttonType: buttonType))
    }
    
    func buttonPrimary(backgroundColor: Color = .brandGray) -> some View {
        self.buttonStyle(ButtonPrimary(backgroundColor: backgroundColor, cornerRadius: 12))
    }
    
    func buttonSecondary(backgroundColor: Color = .white) -> some View {
        self.buttonStyle(ButtonSecondary(backgroundColor: backgroundColor))
    }
}
