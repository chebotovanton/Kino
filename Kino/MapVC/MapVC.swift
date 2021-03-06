import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate {

    private let kAnnotationIdentifier = "annotationIdentifier"
    @IBOutlet private weak var mapView: MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Map"
        mapView?.register(AnnotationView.self, forAnnotationViewWithReuseIdentifier: kAnnotationIdentifier)
        let annotations = createAnnotations()
        mapView?.addAnnotations(annotations)
        setInitialRegion(annotations)
    }

    private func createAnnotations() -> [MKAnnotation] {
        return PointsFactory.allPoints().map{ Annotation(point: $0) }
    }

    private func setInitialRegion(_ annotations: [MKAnnotation]) {
        var minLat = Double.greatestFiniteMagnitude
        var maxLat = -Double.greatestFiniteMagnitude
        var minLon = Double.greatestFiniteMagnitude
        var maxLon = -Double.greatestFiniteMagnitude

        for ann in annotations {
            let lat = ann.coordinate.latitude;
            let lon = ann.coordinate.longitude;
            minLat = min(minLat, lat);
            maxLat = max(maxLat, lat);
            minLon = min(minLon, lon);
            maxLon = max(maxLon, lon);
        }
        let center = CLLocationCoordinate2DMake((maxLat + minLat)/2.0, (maxLon + minLon)/2.0)
        let span = MKCoordinateSpanMake((maxLat - minLat) * 2.0, (maxLon - minLon) * 2.0)

        mapView?.setRegion(MKCoordinateRegionMake(center, span), animated: false)
    }

    // MARK: -  MKMapViewDelegate

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // WARNING: annotation view reuse?
        let annView = AnnotationView(annotation: annotation, reuseIdentifier: kAnnotationIdentifier)
        annView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        annView.backgroundColor = UIColor.black
        annView.layer.cornerRadius = 12

        return annView
    }

}

