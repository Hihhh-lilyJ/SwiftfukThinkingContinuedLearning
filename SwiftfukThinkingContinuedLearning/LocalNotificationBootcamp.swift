//
//  LocalNotificationBootcamp.swift
//  SwiftfukThinkingContinuedLearning
//
//  Created by MacBook Pro on 14/03/2023.
//

import SwiftUI
import UserNotifications
import CoreLocation


class notificationManager {
    static let instance = notificationManager()
    func requestAUthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) {(success, error) in
            if let error = error {
                print(("ERROR: \(error)"))
            } else {
                print("SUCCESS")
            }
        }
    }
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content .title = "This is my first notification"
        content .subtitle = "This was so easy"
        content .sound = .default
        content .badge = 1
        
//        let trigger = UNTimeIntervalNotificationTrigger(
//            timeInterval: 5,
//            repeats: false)
//
//        let request = UNNotificationRequest(
//            identifier: UUID().uuidString,
//            content: content ,
//            trigger: trigger)
//        UNUserNotificationCenter.current().add(request)
        
        let coordinates = CLLocationCoordinate2D(
            latitude: 40,
            longitude: 50)
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        let trigger = UNLocationNotificationTrigger(
            region: region,
            repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}


struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permisions") {
                notificationManager.instance.requestAUthorization()
            }
            Button("Schedule Notifications") {
                notificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notifications") {
                notificationManager.instance.cancelNotification()
            }
        }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
