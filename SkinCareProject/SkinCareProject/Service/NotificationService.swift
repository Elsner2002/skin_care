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
    
    
    func dispatchNotification(identifier: String, hour: Int, minute: Int) {
        let title = "SkinCare App"
        var body = "It's time to do your night skincare routine!"
        if identifier == "morningTime"{
            body = "It's time to do your morning skincare routine!"
        }
        let isDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        var content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        content.badge = 1
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current )
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        //if the user changed the time, deletes the previous
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
        
    }
}
