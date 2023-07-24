//
//  Classes.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI

class User {
    var name: String
    var profileImage: Image
    var vegan: Bool
    var phototype: Phototype
    var skinType: SkinType
    var conditions: [Condition]
    
    init(name: String, phototype: Phototype, skinType: SkinType, profileImage: Image, conditions: [Condition], vegan: Bool) {
        self.name = name
        self.phototype = phototype
        self.skinType = skinType
        self.profileImage = profileImage
        self.conditions = conditions
        self.vegan = vegan
    }
}

class ListProduct {
    var image: Image
    var name: String
    var explanation: String
    var brand: String
    var recomendedTime: [String]
    var vegan: Bool
    var barcode: Int
    var priceRange: Int
    var SPF: Int
    var texture: Texture
    var ingredients: [String]
    var categories: [Category]
    var warnings: [Warning]?
    var phototypes: [Phototype]?
    var skintypes: [SkinType]?
    var conditions: [Condition]?
    
    init(image: Image, name: String, explanation: String, brand: String, recomendedTime: [String], vegan: Bool, barcode: Int, priceRange: Int, SPF: Int, texture: Texture, ingredients: [String], categories: [Category], warnings: [Warning]? = nil, phototypes: [Phototype]? = nil, skintypes: [SkinType]? = nil, conditions: [Condition]? = nil) {
        self.image = image
        self.name = name
        self.explanation = explanation
        self.brand = brand
        self.recomendedTime = recomendedTime
        self.vegan = vegan
        self.barcode = barcode
        self.priceRange = priceRange
        self.SPF = SPF
        self.texture = texture
        self.ingredients = ingredients
        self.categories = categories
        self.warnings = warnings
        self.phototypes = phototypes
        self.skintypes = skintypes
        self.conditions = conditions
    }
}

class RoutineProduct {
    var image: Image
    var name: String
    var isCompleted: Bool
    var barcode: Int
    var timesDay: Int
    var frequency: [Int]
    var categories: [Category]
    
    init(image: Image, name: String, isCompleted: Bool, barcode: Int, categories: [Category], timesDay: Int, frequency: [Int]) {
        self.image = image
        self.name = name
        self.isCompleted = isCompleted
        self.barcode = barcode
        self.categories = categories
        self.frequency = frequency
        self.timesDay = timesDay
    }
}

class Tip {
    var title: String
    var text: String
    var image: Image
    
    init(title: String, text: String, image: Image) {
        self.title = title
        self.text = text
        self.image = image
    }
}

class Routine {
    var name: String
    var completition: Int
    var categories: [Category: [RoutineProduct]?]
    
    init(name: String, completition: Int, categories: [Category : [RoutineProduct]?]) {
        self.name = name
        self.completition = completition
        self.categories = categories
    }
}
