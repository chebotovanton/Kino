import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UNUserNotificationCenter.current().delegate = self

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let time = DispatchTime.now() + 1.0
        DispatchQueue.main.asyncAfter(deadline: time, execute: {
            if let point = PointsFactory.allPoints().first {
                NotificationsManager.shared.presentNotification(point)
            }
        })
    }

    // MARK: - UNUserNotificationCenterDelegate

    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        let notification = response.notification
        let id = notification.request.identifier

        if let point = PointsFactory.point(with: id) {
            QuizManager.shared.showQuestion(point)
        }

        completionHandler()
    }

}

