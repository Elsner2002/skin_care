//
//  Enums.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation

enum Phototype: Int {
    case zero = 0
    case one
    case two
    case three
    case four
    case five
    case six
    
    var title: String {
        return "Tipo \(self.rawValue)"
    }
}

enum SkinType: String {
    case oily = "Oleosa"
    case dry = "Seca"
    case normal = "Normal"
    case combination = "Mista"
    case sensitive = "Sensível"
}

enum Condition {
    
}

enum Warning {
    
}

enum Category: String {
    case moisturizer = "Hidratante"
    case cleanser = "Cleanser"
    case sunscreen = "Protetor Solar"
    case serun = "Serun"
    case mask = "Máscara"
    case antiaging = "Anti-envelhecimento"
    case treatment = "Tratamento"
}
