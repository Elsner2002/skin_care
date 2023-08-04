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
        self.buttonStyle(ButtonPrimary(backgroundColor: backgroundColor))
    }
    
    func buttonSecondary(backgroundColor: Color = .brandGray) -> some View {
        self.buttonStyle(ButtonSecondary(backgroundColor: backgroundColor))
    }
    
    func buttonTerciary() -> some View {
        self.buttonStyle(ButtonTerciary())
    }
}
