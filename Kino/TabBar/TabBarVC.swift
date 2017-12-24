import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.black

        let pointsVC = PointsVC(nibName: "PointsVC", bundle: nil)
        let secondVC = SecondViewController(nibName: "SecondViewController", bundle: nil)
        viewControllers = [pointsVC, secondVC]
    }

}


//
//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
//{
//    HLMenuItem *menuItem = [HLMenuManager shared].items[item.tag];
//    [HLMenuManager shared].selectedItem = menuItem;
//    HLSearchFormStatisticObject.shared.searchReferrerButton = HLSearchReferrerButtonTabBar;
//}
