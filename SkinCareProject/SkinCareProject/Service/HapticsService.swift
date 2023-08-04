//
//  HapticsService.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 01/08/23.
//

import UIKit

class HapticService {
    static let instance = HapticService()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
