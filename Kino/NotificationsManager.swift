import UIKit
import UserNotifications

protocol NotificationManagerDelegate: class {
    func notificationAccessGranted(_ granted: Bool)
}

class NotificationsManager: NSObject {

    static let shared = NotificationsManager()
    let hourLength: TimeInterval = 60 * 60
    weak var delegate: NotificationManagerDelegate?

    func authorize() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (success, error) in
            DispatchQueue.main.async {
                if success {
                }
            }
        }
    }

    func setNotificationAfter(interval: TimeInterval, title: String, body:String, identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound(named: "notification.wav")
        if let att = attachmentSound() {
            content.attachments = [att]
        }

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (err) in
            if let error = err {
                NSLog(error.localizedDescription)
            }
        }
    }

    private func attachmentSound() -> UNNotificationAttachment? {
        if let url = Bundle.main.url(forResource: "kirov_reporting", withExtension: "mp3") {
            let att = try! UNNotificationAttachment(identifier: "sound", url: url, options: nil)
            return att
        }
        return nil
    }



    func cancelAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
