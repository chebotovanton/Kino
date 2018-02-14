import CoreLocation
import UIKit

class Point: NSObject {
    let identifier: String
    let coordinate: CLLocationCoordinate2D
    let name: String
    let radius: CLLocationDistance
    let question: String
    let answerOptions: [String]
    let answerIndex: Int
    let photoUrl: String?

    init(coordinate: CLLocationCoordinate2D,
         identifier: String,
         name: String,
         radius: CLLocationDistance,
         question: String,
         answerOptions: [String],
         answerIndex: Int,
         photoUrl: String? = nil) {
        self.identifier = identifier
        self.coordinate = coordinate
        self.name = name
        self.radius = radius
        self.question = question
        self.answerOptions = answerOptions
        self.answerIndex = answerIndex
        self.photoUrl = photoUrl
    }
}
