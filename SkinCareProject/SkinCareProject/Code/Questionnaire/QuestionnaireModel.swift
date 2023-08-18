//
//  OnboardingModel.swift
//  SkinCareProject
//
//  Created by Natalia Dal Pizzol on 04/08/23.
//

import Foundation

enum GenderQuestion: String, CaseIterable, CustomStringConvertible {
    case female = "Feminino"
    case male = "Masculino"
    case other = "Outro"
    
    var description: String {
        switch self {
        case .female: return ""
        case .male: return ""
        case .other: return ""
        }
    }
}

enum SkinTypeQuestion: String, CaseIterable, CustomStringConvertible {
    case dry = "Seca"
    case oily = "Oleosa"
    case combination = "Mista"
    case sensitive = "Sensível"
    case normal = "Normal"
    
    var description: String{
        switch self {
        case .dry: return "Pele com tendência ao ressecamento e descamação."
        case .oily: return "Pele com tendência ao ressecamento e descamação."
        case .combination: return "Pele que caracteriza-se por partes mais oleosas e partes normais à secas."
        case .sensitive: return "Pele com tendência à alergias e sensações desagradáveis como coceira, queimação e formigamento."
        case .normal: return "Pele com textura saudável, sem excesso de brilho ou ressecamento."
        }
    }
}

enum PhototypeQuestion: String, CaseIterable, CustomStringConvertible {
    case one = "Queima facilmente, não bronzeia"
    case two = "Queima facilmente, bronzeia pouco"
    case three = "Queima pouco, bronzeia gradualmente"
    case four = "Raramente queima, bronzeia fácil"
    case five = "Não queima e bronzeia"
    case six = "Bronzeia facilmente"
    
    var description: String {
        switch self {
        case .one: return "Escala de Fitzpatrick: Fototipo 1"
        case .two: return "Escala de Fitzpatrick: Fototipo 2"
        case .three: return "Escala de Fitzpatrick: Fototipo 3"
        case .four: return "Escala de fitzpatrick: Fototipo 4"
        case .five: return "Escala de Fitzpatrick: Fototipo 5"
        case .six: return "Escala de Fitzpatrick: Fototipo 6"
        }
    }
}

enum SkinConditionQuestion: String, CaseIterable, CustomStringConvertible {
    case rosacea = "Rosácea"
    case vitiligo = "Vitiligo"
    case acne = "Acne"
    case melasma = "Melasma"
    
    
    var description: String {
        switch self {
        case .rosacea: return "Pele sensível com tendencia a ser seca, irritável e fica vermelha facilmente."
        case .vitiligo: return "Doença caracterizada pela perda da coloração da pele a partir da melanina."
        case .acne: return "Inflamação das glândulas sebacêas, provocam cravos, espinhas, cistos, caroços e cicatrizes."
        case .melasma: return "Doença caracterizada pela perda da coloração da pele a partir da melanina."
        }
    }
}
    

enum ConcernsQuestion: String, CaseIterable, CustomStringConvertible {
    case acne = "Espinhas e Cravos"
    case pigmentation = "Manchas"
    case aging = "Rugas e Linhas de expressão"
    case darkCircles = "Olheiras"
    case redness = "Vermelhidão"
    case scars = "Estrias e Cicatrizes"
    
    var description: String {
        switch self {
        case .acne: return ""
        case .pigmentation: return ""
        case .aging: return ""
        case .darkCircles: return ""
        case .redness: return ""
        case .scars: return ""

        }
    }
}

enum EnvironmentQuestions: String, CaseIterable, CustomStringConvertible {
    case dry = "Ambiente Seco"
    case neutral = "Ambiente Neutro"
    case humid = "Ambiente Úmido"
    case unknown = "Não sei"
    
    var description: String {
        switch self {
        case .dry: return ""
        case .neutral: return ""
        case .humid: return ""
        case .unknown: return ""
        }
    }
}

enum PreferenceQuestions: String, CaseIterable, CustomStringConvertible {
    case vegan = "Produtos Veganos"
    case none = "Não tenho preferência"
        
    var description: String {
        switch self {
        case .vegan: return "Produtos que não possuem ingredientes de origem animal"
        case .none: return ""
        }
    }
}

