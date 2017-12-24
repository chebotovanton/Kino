import UIKit

class QuizManager: NSObject {
    static let shared = QuizManager()

    public func showQuestion(_ point: Point) {
        let alert = UIAlertController(title: point.name, message: point.question, preferredStyle: .alert)

        for answerOption in point.answerOptions {
            let action = UIAlertAction(title: answerOption, style: .default, handler: { (action) in

            })
            alert.addAction(action)
        }

        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
