//
//  Enums.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI

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

enum SkinType: String, CaseIterable {
    case oily = "Oleosa"
    case dry = "Seca"
    case normal = "Normal"
    case combination = "Mista"
    case sensitive = "Sensível"
}

enum Gender: String, CaseIterable {
    case female = "Feminino"
    case male = "Masculino"
    case other = "Outro"
}

enum Condition: String {
    case acne = "Acne"
    case rosacea = "Rosácea"
    case melasma = "Melasma"
    case psoriasis = "Psoríase"
    case dermatitis = "Dermatite"
    case vitiligo = "Vitiligo"
    case foliculitis = "Foliculite"
    case none = ""
}

enum Concern: String {
    case pimples = "Espinhas"
    case aging = "Envelhecimento"
    case darkSpots = "Manchas"
    case blackHeads = "Cravos"
    case redness = "Vermelhidão"
    case darkCircles = "Olheiras"
    case none = ""
}

enum Warning {
    
}

enum ProductCategory: String, CaseIterable {
    case moisturizer = "Hidratante"
    case cleanser = "Limpeza"
    case sunscreen = "Protetor Solar"
    case treatment = "Tratamento"
}

enum Texture: String {
    case serum = "Sérum"
    case cream = "Creme"
    case oil = "Óleo"
    case spray = "Spray"
    
}

enum PhototypeQuestions: String, CaseIterable {
    case one = "Queima facilmente, não bronzeia"
    case two = "Queima facilmente, bronzeia pouco"
    case three = "Queima pouco, bronzeia gradualmente"
    case four = "Raramente queima, bronzeia fácil"
    case five = "Não queima e bronzeia"
    case six = "Bronzeia facilmente"
    
}

enum SkinConditionQuestions: String, CaseIterable {
    case rosacea = "Rosácea"
    case vitiligo = "Vitiligo"
    case acne = "Acne"
    case melasma = "Melasma"
    
}
