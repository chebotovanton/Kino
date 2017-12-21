import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate {

    static let shared = LocationManager()

    let locationManager = CLLocationManager()
    public var sourceVC: UIViewController?

    public func start() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            showErrorAlert()
        } else if status  == .authorizedWhenInUse || status == .authorizedAlways {
            startRegionsMonitoring()
        }
    }

    private func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "No can do", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)

        sourceVC?.present(alert, animated: true, completion: nil)
    }

    private func startRegionsMonitoring() {
        for point in PointsFactory.allPoints() {
            let region = CLCircularRegion(center: point.coordinate, radius: point.radius, identifier: point.name)
            locationManager.startMonitoring(for: region)
        }
    }

    private func presentNotification(_ point: Point) {
        let body = "You've reached " + point.name
        NotificationsManager.shared.setNotificationAfter(interval: 1.0, title: "Success", body: body, identifier: point.name)
    }

    // MARK: - CLLocationManagerDelegate Methods

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if let point = PointsFactory.point(with: region.identifier) {
            presentNotification(point)
        }
    }

}
