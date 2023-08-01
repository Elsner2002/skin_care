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
    
    
//    let unpressedColor = Color.systemMaterial
//    let pressedColor = Color.systemButton
//    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .background(configuration.isPressed ? pressedColor : unpressedColor)
    
    }
    
    
    
}
