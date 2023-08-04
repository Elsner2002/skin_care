//
//  NotificationService.swift
//  SkinCareProject
//
//  Created by Marina Yamaguti on 01/08/23.
//

import Foundation
import UserNotifications

class NotificationService {
    
    static let intance = NotificationService()
    
    func requestAutorization() -> Bool {
        var requested = false
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) {success, error in
            if let error = error {
                print("ERROR: \(error)")
                requested = false
            } else {
                print ("SUCCESS")
                requested = true
            }
        }
        return requested
    }
    
    func scheduleNotification(hour: Int, minute: Int) {
        
        let content = UNMutableNotificationContent()
        content.title = "SkinCare App"
        content.subtitle = "It's time to complete your skincare routine :)!"
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
