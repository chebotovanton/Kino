import CoreLocation
import UIKit

class PointsFactory: NSObject {

    class func allPoints() -> [Point] {
        return [Point(coordinate: CLLocationCoordinate2DMake(51.4770994, -0.2874054),
                      name: "Kew Gardens",
                      radius: 300,
                      question: "Name the capital of Great Britain",
                      answerOptions: ["Moscow", "London", "Budapest", "Omsk"],
                      answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(51.4948765, -0.2282221),
                      name: "Shazam London",
                      radius: 300,
                      question: "Who's the Kino band frontman",
                      answerOptions: ["Johnny Depp", "Viktor Tsoi", "Boris 'the Blade' Grebenshikov", "Anita Tsoi", "Korolenko Psoi"], answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(59.9352842, 30.3584432),
                      name: "Home",
                      radius: 300,
                      question: "Name the capital of Great Britain",
                      answerOptions: ["Moscow", "London", "Budapest", "Omsk"],
                      answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(59.986609, 30.2019042),
                      name: "Work",
                      radius: 300,
                      question: "Who's the Kino band frontman",
                      answerOptions: ["Johnny Depp", "Viktor Tsoi", "Boris 'the Blade' Grebenshikov", "Anita Tsoi", "Korolenko Psoi"], answerIndex: 1)
        ]
    }

    class func point(with name: String) -> Point? {
        for point in allPoints() {
            if point.name == name {
                return point
            }
        }

        return nil
    }
}
