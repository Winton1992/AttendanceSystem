//
//  ViewController+Notification.swift
//  AttendanceSystem
//
//  Created by LIWEIJIE on 15/7/20.
//  Copyright © 2020 weijie. All rights reserved.
//
import UserNotifications

extension ViewController {
    func postEnterNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Welcome to the Office."
        content.body = "Kind regards from IOS team."
        content.sound = UNNotificationSound.default
        let request = UNNotificationRequest(identifier: "Entry Notification", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func postExitNotification() {
        let content = UNMutableNotificationContent()
        content.title = "See you tomorrow."
        content.body = "Kind regards from IOS team."
        content.sound = UNNotificationSound.default
        let request = UNNotificationRequest(identifier: "Exit Notification", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
}

