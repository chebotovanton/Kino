import UIKit

class QuizManager: NSObject {
    static let shared = QuizManager()

    public func showQuestion(_ point: Point) {
        let alert = UIAlertController(title: point.name, message: point.question, preferredStyle: .alert)

        for i in 0..<point.answerOptions.count {
            let option = point.answerOptions[i]
            let action = UIAlertAction(title: option, style: .default, handler: { (action) in
                if point.answerIndex == i {
                    PointsFactory.setPointDone(point)
                }
            })
            alert.addAction(action)
        }

        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
