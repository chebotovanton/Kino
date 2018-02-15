import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.black

        let pointsVC = PointsVC(nibName: "PointsVC", bundle: nil)
        let secondVC = MapVC(nibName: "MapVC", bundle: nil)
        viewControllers = [UINavigationController(rootViewController: pointsVC), secondVC]
    }

}
