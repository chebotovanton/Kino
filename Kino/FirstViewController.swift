import UIKit

class FirstViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationManager.shared.sourceVC = self
        LocationManager.shared.start()

        NotificationsManager.shared.authorize()
    }

    override func viewDidAppear(_ animated: Bool) {

    }

}

