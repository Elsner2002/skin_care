//
//  ButtonExtension.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 01/08/23.
//


import Foundation
import SwiftUI

extension Button {
    func buttonPrimary(backgroundColor: Color = .brandGray) -> some View {
        self.buttonStyle(ButtonPrimary(backgroundColor: backgroundColor, cornerRadius: 12))
    }
    

    
    func customButtonStyle(buttonType: ButtonType) -> some View {
        self.buttonStyle(CustomButtonStyle(buttonType: buttonType))
    }
}
