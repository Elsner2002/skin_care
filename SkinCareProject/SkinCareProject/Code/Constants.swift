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
    
}
