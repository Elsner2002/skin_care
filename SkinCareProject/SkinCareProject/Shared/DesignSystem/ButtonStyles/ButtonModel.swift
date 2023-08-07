//
//  ButtonModel.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import Foundation
import SwiftUI

enum ButtonType: String {
    case smallRounded = "navigation"
    case largeRounded = "singleSelection"
    case largeRoundedOverlay = "largeRoundedOverlay"
    
    var font: Font {
        switch self {
        case .smallRounded: return .caption
        case .largeRounded: return .body
        case .largeRoundedOverlay: return .body
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .smallRounded: return 8.57
        case .largeRounded: return 12.0
        case .largeRoundedOverlay: return 12.0
        }
    }
    
    var primaryColor: Color {
        switch self {
        case .smallRounded: return .buttonColor
        case .largeRounded: return .buttonColor
        case .largeRoundedOverlay: return .brandWhite
        }
    }
    
    var labelColor: Color {
        switch self {
        case .smallRounded: return .systemLabelSecondary
        case .largeRounded: return .systemLabelPrimary
        case .largeRoundedOverlay: return .systemLabelSecondary
        }
    }
    
    var overlay: Bool {
        switch self {
        case .smallRounded: return false
        case .largeRounded: return false
        case .largeRoundedOverlay: return true
        }
    }
}
