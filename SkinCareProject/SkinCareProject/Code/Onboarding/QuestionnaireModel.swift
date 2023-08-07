//
//  OnboardingModel.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import Foundation





enum GenderQuestion: String, CaseIterable {
    case female = "Feminino"
    case male = "Masculino"
    case other = "Outro"
}

enum SkinTypeQuestion: String, CaseIterable {
    case oily = "Oleosa"
    case dry = "Seca"
    case normal = "Normal"
    case combination = "Mista"
    case sensitive = "Sensível"
}

enum PhototypeQuestion: String, CaseIterable {
    case one = "Queima facilmente, não bronzeia"
    case two = "Queima facilmente, bronzeia pouco"
    case three = "Queima pouco, bronzeia gradualmente"
    case four = "Raramente queima, bronzeia fácil"
    case five = "Não queima e bronzeia"
    case six = "Bronzeia facilmente"
    
}

enum SkinConditionQuestion: String, CaseIterable {
    case rosacea = "Rosácea"
    case vitiligo = "Vitiligo"
    case acne = "Acne"
    case melasma = "Melasma"
    
}

enum ConcernsQuestion: String, CaseIterable {
    case acne = "Espinhas e Cravos"
    case pigmentation = "Manchas"
    case aging = "Rugas e Linhas de expressão"
    case darkCircles = "Olheiras"
    case redness = "Vermelhidão"
    case scars = "Estrias e Cicatrizes"
    
}

enum EnvironmentQuestions: String, CaseIterable {
    case dry = "Ambiente Seco"
    case neutral = "Ambiente Neutro"
    case humid = "Ambiente Úmido"
    case unknown = "Não sei"
}

enum PreferenceQuestions: String, CaseIterable {
    case vegan = "Produtos Veganos"
    case none = "Não tenho preferência"
}

