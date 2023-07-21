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
    var phototype: Phototype
    var skinType: SkinType
    var profileImage: Image
    var conditions: [Condition]
    var vegan: Bool
    
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
    var vegan: Bool
    var barcode: Int
    var ingredients: [String]
    var categories: [Category]
    var warnings: [Warning]?
    var phototypes: [Phototype]?
    var skintypes: [SkinType]?
    var conditions: [Condition]?
    
    init(image: Image, name: String, explanation: String, brand: String, vegan: Bool, barcode: Int, ingredients: [String], categories: [Category], warnings: [Warning]? = nil, phototypes: [Phototype]? = nil, skintypes: [SkinType]? = nil, conditions: [Condition]? = nil) {
        self.image = image
        self.name = name
        self.explanation = explanation
        self.brand = brand
        self.vegan = vegan
        self.barcode = barcode
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
    var categories: [Category]
    var frequency: [Int]
    
    init(image: Image, name: String, isCompleted: Bool, barcode: Int, categories: [Category], frequency: [Int]) {
        self.image = image
        self.name = name
        self.isCompleted = isCompleted
        self.barcode = barcode
        self.categories = categories
        self.frequency = frequency
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
    var completition: Bool//Int
    var categories: [Category: [RoutineProduct]?]
    
    init(name: String, completition: Bool, categories: [Category : [RoutineProduct]?]) {
        self.name = name
        self.completition = completition
        self.categories = categories
    }
}
