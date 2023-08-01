//
//  ButtonExtension.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 01/08/23.
//


import Foundation
import SwiftUI

extension Button {
    func buttonPrimary() -> some View {
        self.buttonStyle(ButtonPrimary())
    }
}
