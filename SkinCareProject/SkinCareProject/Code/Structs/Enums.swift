//
//  Enums.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation

enum Phototype: String {
    case zero = "Tipo 0"
    case one = "Tipo 1"
    case two = "Tipo 2"
    case three = "Tipo 3"
    case four = "Tipo 4"
    case five = "Tipo 5"
    case six = "Tipo 6"
    
    func typeNumber() -> Int{
        switch self{
        case .zero:
            return 0
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        }
    }
}

enum SkinType: String {
    case oily = "Oleosa"
    case dry = "Seca"
    case normal = "Normal"
    case combination = "Mista"
    case sensitive = "Sensível"
}
