import UIKit
import SDWebImage

class PointCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusView: UIView!
    @IBOutlet private weak var pointImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        pointImageView.contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    func setup(_ point: Point) {
        nameLabel.text = point.name
        statusView.backgroundColor = PointsFactory.isPointDone(point: point) ? UIColor.green : UIColor.red

        if let urlString = point.photoUrl {
            let url = URL(string: urlString)
            pointImageView.sd_setImage(with: url, completed: nil)
        }
    }

}
