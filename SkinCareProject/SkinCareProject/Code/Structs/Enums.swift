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

enum Condition: String {
    case acne = "Acne"
    case rosacea = "Rosácea"
    case melasma = "Melasma"
    case psoriasis = "Psoríase"
    case dermatitis = "Dermatite"
    case vitiligo = "Vitiligo"
    case foliculitis = "Foliculite"
}

enum Concern: String {
    case pimples = "Espinhas"
    case aging = "Envelhecimento"
    case darkSpots = "Manchas"
    case blackHeads = "Cravos"
    case redness = "Vermelhidão"
    case darkCircles = "Olheiras"
//    case wrinkles = "Rugas"
//    case scarring = "Estrias/Cicatrizes"
}

enum Warning {
    
}

enum ProductCategory: String {
    case moisturizer = "Hidratante"
    case cleanser = "Cleanser"
    case sunscreen = "Protetor Solar"
    case serum = "Sérum"
    case mask = "Máscara"
    case antiaging = "Anti-envelhecimento"
    case treatment = "Tratamento"
}

enum Texture: String {
    case serum = "Sérum"
    case cream = "Creme"
    case oil = "Óleo"
    case spray = "Spray"
}
