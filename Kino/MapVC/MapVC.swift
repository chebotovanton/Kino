import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate {

    private let kAnnotationIdentifier = "annotationIdentifier"
    @IBOutlet private weak var mapView: MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Map"
        mapView?.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: kAnnotationIdentifier)
        mapView?.addAnnotations(createAnnotations())
    }

    private func createAnnotations() -> [MKAnnotation] {
        let result = PointsFactory.allPoints().map{ Annotation(point: $0) }
        return result
    }


    //mark: -  MKMapViewDelegate

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annView = mapView.dequeueReusableAnnotationView(withIdentifier: kAnnotationIdentifier, for: annotation)

        return annView
    }

}
