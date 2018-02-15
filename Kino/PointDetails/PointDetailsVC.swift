import UIKit
import BSStackView

class PointDetailsVC: UIViewController {

    var point: Point!
    @IBOutlet weak private var stackView: BSStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        var photoViews: [UIView] = []
        for urlString in point.photoUrls {
            let url = URL(string: urlString)
            let photoView = UIImageView()
            photoView.sd_setImage(with: url, completed: nil)
            photoViews.append(photoView)
        }

        stackView.swipeDirections = [.left, .right, .up, .down]
        stackView.forwardDirections = [.right, .up]
        stackView.backwardDirections = [.left, .down]
        stackView.changeAlphaOnSendAnimation = true
        stackView.configure(with: photoViews)
//        self.stackView.delegate = self;

    }
}
