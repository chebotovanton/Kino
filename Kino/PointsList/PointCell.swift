import UIKit

class PointCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(_ point: Point) {
        nameLabel.text = point.name
        statusView.backgroundColor = point.done() ? UIColor.green : UIColor.red
    }

}
