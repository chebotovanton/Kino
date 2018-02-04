import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var point: Point
    var title: String?

    init(point: Point) {
        self.point = point
        self.coordinate = point.coordinate
        self.title = point.name
    }
}



