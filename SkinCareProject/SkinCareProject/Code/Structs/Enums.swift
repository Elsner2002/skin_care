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
    case none = "None"
}

enum Concern: String {
    case pimples = "Espinhas e Cravos"
    case aging = "Rugas e Linhas de Expressão"
    case darkSpots = "Manchas"
    case redness = "Vermelhidão"
    case darkCircles = "Olheiras"
    case stretchMarks = "Estrias e Cicatrizes"
    case none = "None"
}

enum Location: String {
    case dry = "Ambiente Seco"
    case neutral = "Ambiente Neutro"
    case humid = "Ambiente Úmido"
    case none = "Não Sei"
}

enum Warning: String {
    case irritationCase = "Em caso de irritação, suspenda o uso e procure orientação médica."
    case eyeAreaContact = "Evite a área dos olhos."
    case eyeDirectContact = "Evite contato direto com os olhos."
    case washEye = "Caso haja contato com os olhos, lave-os abundantemente."
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


enum buttonLabels: String {
    case next = "Próximo"
    case save = "Salvar"
}
