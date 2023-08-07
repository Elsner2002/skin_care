//
//  Classes.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI
import CloudKit

class AppUser: CloudKitProtocol {
    var profileImage: URL?
    var vegan: Bool
    var phototype: String
    var skinType: String
    var conditions: [String]
    var concerns: [String]
    var record: CKRecord
    
    required init?(record: CKRecord) {
        let imageAsset = record["profileImage"] as? CKAsset
        self.profileImage = imageAsset?.fileURL
        guard let vegan = record["vegan"] as? Bool else {return nil}
        self.vegan = vegan
        guard let phototype = record["phototype"] as? String else {return nil}
        self.phototype = phototype
        guard let skinType = record["skinType"] as? String else {return nil}
        self.skinType = skinType
        guard let conditions = record["conditions"] as? [String] else {return nil}
        self.conditions = conditions
        guard let concerns = record["concerns"] as? [String] else {return nil}
        self.concerns = concerns
        self.record = record
    }
    
    required convenience init?(profileImage: URL?, vegan: Bool, phototype: String, skinType: String,  conditions: [String], concerns: [String]){
        let record = CKRecord(recordType: "User")
        if let url = profileImage {
            let asset = CKAsset(fileURL: url)
                record["profileImage"] = asset
        }
        record["vegan"] = vegan
        record["phototype"] = phototype
        record["skinType"] = skinType
        record["conditions"] = conditions
        record["concerns"] = concerns

        self.init(record: record)
    }
    
    
    func updateVegan(newVegan: Bool) -> AppUser? {
        let newRecord = record
        newRecord["vegan"] = newVegan
        return AppUser(record: newRecord)
    }
    
    func updatePhototype(newPhototype: String) -> AppUser? {
        let newRecord = record
        newRecord["phototype"] = newPhototype
        return AppUser(record: newRecord)
    }

    func updateSkinType(newSkinType: String) -> AppUser? {
        let newRecord = record
        newRecord["skinType"] = newSkinType
        return AppUser(record: newRecord)
    }
    
    func updateConditions(newConditions: [String]) -> AppUser? {
        let newRecord = record
        newRecord["conditions"] = newConditions
        return AppUser(record: newRecord)
    }
    
    func updateImage(newImage: URL) -> AppUser? {
        let newRecord = record
        newRecord["profileImage"] = newImage
        return AppUser(record: newRecord)
    }
    
}

class ListProduct: CloudKitProtocol, Hashable {
    
    static func == (lhs: ListProduct, rhs: ListProduct) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    var hashValue: Int {
          return ObjectIdentifier(self).hashValue
      }
    
    var image: URL?
    var name: String
    var explanation: String
    var brand: String
    var recomendedTime: [String]
    var vegan: Bool
    var barcode: Int
    var priceRange: Int
    var SPF: Int
    var texture: String
    var ingredients: [String]
    var categories: [String]
    var warnings: [String]?
    var phototypes: [String]?
    var skintypes: [String]?
    var conditions: [String]?
    let record: CKRecord
    
    required init?(record: CKRecord) {
        let imageAsset = record["image"] as? CKAsset
        self.image = imageAsset?.fileURL
        guard let name = record["name"] as? String else {return nil}
        self.name = name
        guard let explanation = record["explanation"] as? String else {return nil}
        self.explanation = explanation
        guard let brand = record["brand"] as? String else {return nil}
        self.brand = brand
        guard let recomendedTime = record["recomendedTime"] as? [String] else {return nil}
        self.recomendedTime = recomendedTime
        guard let vegan = record["vegan"] as? Bool else {return nil}
        self.vegan = vegan
        guard let barcode = record["barcode"] as? Int else {return nil}
        self.barcode = barcode
        guard let priceRange = record["priceRange"] as? Int else {return nil}
        self.priceRange = priceRange
        guard let SPF = record["SPF"] as? Int else {return nil}
        self.SPF = SPF
        guard let texture = record["texture"] as? String else {return nil}
        self.texture = texture
        guard let ingredients = record["ingredients"] as? [String] else {return nil}
        self.ingredients = ingredients
        guard let categories = record["categories"] as? [String] else {return nil}
        self.categories = categories
        guard let warnings = record["warnings"] as? [String] else {return nil}
        self.warnings = warnings
        guard let phototypes = record["phototypes"] as? [String] else {return nil}
        self.phototypes = phototypes
        guard let skintypes = record["skintypes"] as? [String] else {return nil}
        self.skintypes = skintypes
        guard let conditions = record["conditions"] as? [String] else {return nil}
        self.conditions = conditions
        
        self.record = record
    }
    
    required convenience init?(image: URL?, name: String, explanation: String, brand: String, recomendedTime: [String], vegan: Bool, barcode: Int, priceRange: Int, SPF: Int, texture: String, ingredients: [String], categories: [String], warnings: [String]? = nil, phototypes: [String]? = nil, skintypes: [String]? = nil, conditions: [String]? = nil) {
        
        let record = CKRecord(recordType: "ListProduct")
        
        record["name"] = name
        
        if let url = image {
            let asset = CKAsset(fileURL: url)
            record["image"] = asset
        }
        
        record["explanation"] = explanation
        record["brand"] = brand
        record["recomendedTime"] = recomendedTime
        record["vegan"] = vegan
        record["barcode"] = barcode
        record["priceRange"] = priceRange
        record["SPF"] = SPF
        record["texture"] = texture
        record["ingredients"] = ingredients
        record["categories"] = categories
        record["warnings"] = warnings
        record["phototypes"] = phototypes
        record["skintypes"] = skintypes
        record["conditions"] = conditions
        
        self.init(record: record)
    }
    
}

class RoutineProduct: CloudKitProtocol, Hashable {
    
    static func == (lhs: RoutineProduct, rhs: RoutineProduct) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    var hashValue: Int {
          return ObjectIdentifier(self).hashValue
      }
    
    
    var image: URL?
    var name: String
    var brand: String
    var isCompleted: Bool
    var barcode: Int
    var frequency: [Int]
    var categories: [String]
    var record: CKRecord
    
    required init?(record: CKRecord) {
        let imageAsset = record["image"] as? CKAsset
        self.image = imageAsset?.fileURL
        guard let name = record["name"] as? String else {return nil}
        self.name = name
        guard let brand = record["brand"] as? String else {return nil}
        self.brand = brand
        guard let isCompleted = record["isCompleted"] as? Bool else {return nil}
        self.isCompleted = isCompleted
        guard let barcode = record["barcode"] as? Int else {return nil}
        self.barcode = barcode
        guard let frequency = record["frequency"] as? [Int] else {return nil}
        self.frequency = frequency
        guard let categories = record["categories"] as? [String] else {return nil}
        self.categories = categories
        self.record = record
    }
    
    required convenience init?(image: URL?, name: String, brand: String, isCompleted: Bool, barcode: Int, frequency: [Int], categories: [String]) {
        
        let record = CKRecord(recordType: "RoutineProduct")
        record["name"] = name
        record["brand"] = brand
        
        if let url = image {
            let asset = CKAsset(fileURL: url)
            record["image"] = asset
        }
        record["isCompleted"] = isCompleted
        record["barcode"] = barcode
        record["frequency"] = frequency
        record["categories"] = categories
        
        self.init(record: record)
    }
    
    func updateName(newName: String) -> RoutineProduct? {
        let newRecord = record
        newRecord["name"] = newName
        return RoutineProduct(record: newRecord)
    }
    
    func updateBrand(newBrand: String) -> RoutineProduct? {
        let newRecord = record
        newRecord["brand"] = newBrand
        return RoutineProduct(record: newRecord)
    }

    func updateIsCompleted(newCompletion: Bool) -> RoutineProduct? {
        let newRecord = record
        newRecord["isCompleted"] = newCompletion
        return RoutineProduct(record: newRecord)
    }
    
    func updateFrequency(newFrequency: [Int]) -> RoutineProduct? {
        let newRecord = record
        newRecord["frequency"] = newFrequency
        return RoutineProduct(record: newRecord)
    }
    
    func updateCategories(newCategories: [String]) -> RoutineProduct? {
        let newRecord = record
        newRecord["categories"] = newCategories
        return RoutineProduct(record: newRecord)
    }
    
    func updateImage(newImage: URL) -> RoutineProduct? {
        let newRecord = record
        newRecord["image"] = newImage
        return RoutineProduct(record: newRecord)
    }
}

extension URL: CKRecordValueProtocol {
    
}

class Tip: CloudKitProtocol {
    var title: String
    var text: String
    var image: URL?
    let record: CKRecord
    
    required init?(record: CKRecord) {
        let imageAsset = record["image"] as? CKAsset
        self.image = imageAsset?.fileURL
        guard let title = record["title"] as? String else {return nil}
        self.title = title
        guard let text = record["text"] as? String else {return nil}
        self.text = text
        self.record = record
    }
    
    required convenience init?(title: String, text: String, image: URL?){
        let record = CKRecord(recordType: "Tip")
        if let url = image {
            let asset = CKAsset(fileURL: url)
                record["image"] = asset
        }
        record["title"] = title
        record["text"] = text

        self.init(record: record)
    }
}

class Routine {
    var name: String
    var completition: Int
    //var categories: [ProductCategory: [RoutineProduct]?]
    var categoryLimpeza: [RoutineProduct]
    var categoryTratamentos: [RoutineProduct]
    var categoryHidratante: [RoutineProduct]
    var categoryProtetor: [RoutineProduct]
    
    init(name: String, completition: Int, categoryLimpeza: [RoutineProduct], categoryTratamentos: [RoutineProduct], categoryHidratante: [RoutineProduct], categoryProtetor: [RoutineProduct]) {
        self.name = name
        self.completition = completition
        self.categoryLimpeza = categoryLimpeza
        self.categoryTratamentos = categoryTratamentos
        self.categoryHidratante = categoryHidratante
        self.categoryProtetor = categoryProtetor
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
