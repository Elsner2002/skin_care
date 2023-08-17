//
//  Constants.swift
//  SkinCareProject
//
//  Created by Felipe  Elsner Silva on 18/07/23.
//

import Foundation
import SwiftUI

class Constants: ObservableObject {
    static let shared: Constants = Constants()
    
    //routine variables
    @Published var dayCompletion: Int = UserDefaults.standard.value(forKey: "dayCompletion") as? Int ?? 0 {
       didSet {
           UserDefaults.standard.set(dayCompletion, forKey: "dayCompletion")
       }
   }
    
    @Published var nightCompletion: Int = UserDefaults.standard.value(forKey: "nightCompletion") as? Int ?? 0 {
       didSet {
           UserDefaults.standard.set(nightCompletion, forKey: "nightCompletion")
       }
   }
    
    
    @Published var dayRoutine = Routine(name: "Rotina Diurna", completition: 0, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])
    
    @Published var nightRoutine = Routine(name: "Rotina Noturna", completition: 0, categoryLimpeza: [], categoryTratamentos: [], categoryHidratante: [], categoryProtetor: [])
    
    
    //MARK: create variables here
    //tips variables
    @ObservedObject var tipsData = TipsService()
    var randomTip: Tip?
    func randomTipGenerator(){
        if !compareDay(){
            randomTip = tipsData.getTips().randomElement()
            let encodedTip = try? JSONEncoder().encode(randomTip)
            UserDefaults.standard.set(encodedTip, forKey: "randomTip")
            dayCompletion = 0
            nightCompletion = 0
        }
        else{
            randomTip = try? JSONDecoder().decode(Tip.self, from: UserDefaults.standard.data(forKey: "randomTip")!)
        }
        lastDay = Date.now
    }
    
    //days variables
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
    @Published var lastDay = UserDefaults.standard.value(forKey: "lastDay") as? Date {
        didSet{
            UserDefaults.standard.set(lastDay, forKey: "lastDay")
        }
    }
    func compareDay() -> Bool {
        guard let dayBefore = lastDay else {
            return false
        }
        let componentsLast = Calendar.current.dateComponents([.day], from: dayBefore).day
        let componentsToday = Calendar.current.dateComponents([.day], from: Date.now).day
        
        return componentsLast == componentsToday
    }
    
    init() {
        if lastDay == nil {
            lastDay = dayBefore
            dayCompletion = 0
            nightCompletion = 0
        }
        randomTipGenerator()
    }
    
    //price range
    func priceRange(price: Int) -> String {
        switch price {
        case 0...30:
            return "$"
        case 31...50:
            return "$$"
        case 51...80:
            return "$$$"
        case 81...120:
            return "$$$$"
        case _ where price > 121:
            return "$$$$$"
        default:
            return ""
        }
        
    }
    
    //MARK: Notifications
    
    @Published var notification: Bool = UserDefaults.standard.value(forKey: "notification") as? Bool ?? false {
        didSet {
            NotificationService.intance.requestAutorization()
            if !notification {
                morningNotification = false
                nightNotification = false
                
            } else if notification {
                morningNotification = true
                nightNotification = true
            }
            UserDefaults.standard.set(notification, forKey: "notification")
        }
    }
    
    @Published var morningTime: Date = UserDefaults.standard.value(forKey: "morningTime") as? Date ?? Date() {
        didSet {
            let componentsMorning = Calendar.current.dateComponents([.hour, .minute], from: morningTime)
            let morningHour = componentsMorning.hour ?? 0
            let morningMinute = componentsMorning.minute ?? 0
            if morningNotification {
                NotificationService.intance.dispatchNotification(identifier: "morningTime", hour: morningHour, minute: morningMinute)
                notification = true
            }
            UserDefaults.standard.set(morningTime, forKey: "morningTime")
        }
    }
    
    @Published var morningNotification: Bool = UserDefaults.standard.value(forKey: "morningNotification") as? Bool ?? false {
        didSet {
            UserDefaults.standard.set(morningNotification, forKey: "morningNotification")
        }
    }
    
    @Published var nightTime: Date = UserDefaults.standard.value(forKey: "nightTime") as? Date ?? Date() {
        didSet {
            let componentsNight = Calendar.current.dateComponents([.hour, .minute], from: nightTime)
            let nightHour = componentsNight.hour ?? 0
            let nightMinute = componentsNight.minute ?? 0
            if nightNotification {
                NotificationService.intance.dispatchNotification(identifier: "nightTime", hour: nightHour, minute: nightMinute)
                notification = true
            }
            UserDefaults.standard.set(nightTime, forKey: "nightTime")
        }
    }
    
    @Published var nightNotification: Bool = UserDefaults.standard.value(forKey: "nightNotification") as? Bool ?? false {
        didSet {
            UserDefaults.standard.set(nightNotification, forKey: "nightNotification")
        }
        
    }
    
    @Published var allowedNotification: Bool = UserDefaults.standard.value(forKey: "allowedNotification") as? Bool ?? false {
        didSet {
            UserDefaults.standard.set(allowedNotification, forKey: "allowedNotification")
        }
    }
    
    //filter funcion
    func filter(category: ProductCategory, productList: [ListProduct]) -> [ListProduct] {
        var list: [ListProduct] = []
        productList.forEach { product in
            if product.categories.contains(category.rawValue) || (product.categories.contains("Sabonete") && category == .cleanser) {
                list.append(product)
            }
        }
        return list
    }
    
    func saveImage(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "PROFILEIMAGE")
    }

    func loadImage() -> UIImage {
        guard let data = UserDefaults.standard.data(forKey: "PROFILEIMAGE") else { return UIImage(named: "ProfileDefault")!}
         let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
         let image = UIImage(data: decoded)
        return image!
    }
}
