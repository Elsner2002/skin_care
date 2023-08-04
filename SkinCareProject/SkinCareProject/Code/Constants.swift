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
    
    //MARK: create variables here
    //tips variables
    @ObservedObject var tipsData = TipsService()
    var randomTip: Tip?
    func randomTipGenerator(){
        if !compareDay(){
            randomTip = tipsData.tips.randomElement()
            let encodedTip = try? JSONEncoder().encode(randomTip)
            UserDefaults.standard.set(encodedTip, forKey: "randomTip")
        }
        else{
            //randomTip = try? JSONDecoder().decode(Tip.self, from: UserDefaults.standard.data(forKey: "randomTip")!)
            randomTip = Tip(title: "Tip 1", text: "Skin care é bom", image: "tipImage")
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
                NotificationService.intance.scheduleNotification(hour: morningHour, minute: morningMinute)
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
                NotificationService.intance.scheduleNotification(hour: nightHour, minute: nightMinute)
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
    
}
