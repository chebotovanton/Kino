import CoreLocation
import UIKit

class PointsFactory: NSObject {

    private static let kDonePointsKey = "donePointsKey"

    class func allPoints() -> [Point] {
        return [Point(coordinate: CLLocationCoordinate2DMake(51.4770994, -0.2874054),
                      identifier: "1",
                      name: "Kew Gardens",
                      radius: 300,
                      question: "Name the capital of Great Britain",
                      answerOptions: ["Moscow", "London", "Budapest", "Omsk"],
                      answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(51.4948765, -0.2282221),
                      identifier: "2",
                      name: "Shazam London",
                      radius: 300,
                      question: "Who's the Kino band frontman",
                      answerOptions: ["Johnny Depp", "Viktor Tsoi", "Boris 'the Blade' Grebenshikov", "Anita Tsoi", "Korolenko Psoi"], answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(59.9352842, 30.3584432),
                      identifier: "3",
                      name: "Anton's home",
                      radius: 300,
                      question: "Name the capital of Great Britain",
                      answerOptions: ["Moscow", "London", "Budapest", "Omsk"],
                      answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(59.986609, 30.2019042),
                      identifier: "4",
                      name: "Anton's office",
                      radius: 300,
                      question: "Who's the Kino band frontman",
                      answerOptions: ["Johnny Depp", "Viktor Tsoi", "Boris 'the Blade' Grebenshikov", "Anita Tsoi", "Korolenko Psoi"], answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(59.877137, 30.3566413),
                      identifier: "5",
                      name: "Rio",
                      radius: 1000,
                      question: "Who's the Kino band frontman",
                      answerOptions: ["Johnny Depp", "Viktor Tsoi", "Boris 'the Blade' Grebenshikov", "Anita Tsoi", "Korolenko Psoi"], answerIndex: 1),
                Point(coordinate: CLLocationCoordinate2DMake(51.469675, -0.286418),
                      identifier: "5",
                      name: "12 Chilton Rd",
                      radius: 300,
                      question: "Who's the Kino band frontman",
                      answerOptions: ["Johnny Depp", "Viktor Tsoi", "Boris 'the Blade' Grebenshikov", "Anita Tsoi", "Korolenko Psoi"], answerIndex: 1)
        ]
    }

    class func point(with id: String) -> Point? {
        for point in allPoints() {
            if point.identifier == id {
                return point
            }
        }

        return nil
    }

    class func setPointDone(_ point: Point) {
        var donePointsIds = UserDefaults.standard.array(forKey: kDonePointsKey) ?? []
        donePointsIds.append(point.identifier)
        UserDefaults.standard.set(donePointsIds, forKey: kDonePointsKey)
    }

    class func isPointDone( point: Point) -> Bool {
        let donePointsIds: [String] = UserDefaults.standard.array(forKey: kDonePointsKey) as? [String] ?? []
        return donePointsIds.contains(where: { $0 == point.identifier })
    }
}
