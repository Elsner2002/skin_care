//
//  Classes.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI
import CloudKit

class User {
    var name: String
    var profileImage: Image
    var vegan: Bool
    var phototype: Phototype
    var skinType: SkinType
    var conditions: [Condition]
    var concerns: [Concern]
    
    init(name: String, phototype: Phototype, skinType: SkinType, profileImage: Image, vegan: Bool, conditions: [Condition], concerns: [Concern]) {
        self.name = name
        self.phototype = phototype
        self.skinType = skinType
        self.profileImage = profileImage
        self.conditions = conditions
        self.concerns = concerns
        self.vegan = vegan
    }
}

class ListProduct {
    var image: URL
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
    var categories: [ProductCategory]
    var concerns: [Concern]
    var warnings: [Warning]?
    var phototypes: [Phototype]?
    var skintypes: [SkinType]?
    var conditions: [Condition]?
    let record: CKRecord?
    
    init(image: URL, name: String, explanation: String, brand: String, recomendedTime: [String], vegan: Bool, barcode: Int, priceRange: Int, SPF: Int, texture: Texture, ingredients: [String], categories: [ProductCategory], concerns: [Concern], warnings: [Warning]? = nil, phototypes: [Phototype]? = nil, skintypes: [SkinType]? = nil, conditions: [Condition]? = nil, record: CKRecord? = nil) {
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
        self.concerns = concerns
        self.warnings = warnings
        self.phototypes = phototypes
        self.skintypes = skintypes
        self.conditions = conditions
        self.record = record
    }
}

class RoutineProduct: CloudKitProtocol {
    var image: URL?
    var name: String
    var isCompleted: Bool
    var barcode: Int
    var timesDay: Int
    var frequency: [Int]
    var categories: [String]
    var record: CKRecord
    
    required init?(record: CKRecord) {
        let imageAsset = record["image"] as? CKAsset
        self.image = imageAsset?.fileURL
        guard let name = record["name"] as? String else {return nil}
        self.name = name
        guard let isCompleted = record["isCompleted"] as? Bool else {return nil}
        self.isCompleted = isCompleted
        guard let barcode = record["barcode"] as? Int else {return nil}
        self.barcode = barcode
        guard let frequency = record["frequency"] as? [Int] else {return nil}
        self.frequency = frequency
        guard let timesDay = record["timesDay"] as? Int else {return nil}
        self.timesDay = timesDay
        guard let categories = record["categories"] as? [String] else {return nil}
        self.categories = categories
        self.record = record
    }
    
    required convenience init?(image: URL?, name: String, isCompleted: Bool, barcode: Int, frequency: [Int], timesDay: Int, categories: [String]) {
        
        let record = CKRecord(recordType: "RoutineProduct")
        record["name"] = name
        
        if let url = image {
            let asset = CKAsset(fileURL: url)
            record["image"] = asset
        }
        record["isCompleted"] = isCompleted
        record["barcode"] = barcode
        record["frequency"] = frequency
        record["timesDay"] = timesDay
        record["categories"] = categories
        
        self.init(record: record)
    }
    
    //do this for every parameter
    func updateName(newName: String) -> RoutineProduct? {
        let newRecord = record
        newRecord["name"] = newName
        return RoutineProduct(record: newRecord)
    }
    
}

struct Tip: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case title
        case text
        case image
    }
    
    var id = UUID()
    var title: String
    var text: String
    var image: String
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
