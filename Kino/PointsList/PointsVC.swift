import UIKit

class PointsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var points: [Point] = []
    private let kCellIdentifier = "PointCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Points"

        LocationManager.shared.sourceVC = self
        LocationManager.shared.start()

        NotificationsManager.shared.authorize()

        tableView.register(UINib(nibName: kCellIdentifier, bundle: nil), forCellReuseIdentifier: kCellIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        points = PointsFactory.allPoints()
        tableView.reloadData()
    }

    // UITableViewDelegate, UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return points.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier)
        if let pointCell = cell as? PointCell {
            let point = points[indexPath.item]
            pointCell.setup(point)
        }

        return cell!
    }

}

