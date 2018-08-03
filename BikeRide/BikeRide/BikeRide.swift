//
//  BikeRide.swift
//  BikeRide
//
//  Created by Jorge Serna on 2018-06-12.
//  Copyright © 2018 Jorge Serna. All rights reserved.
//

import Foundation
import MapKit

class BikeRide {
    
    var title: String
    var map: String
    var people: String
    var rating: String
    var level: String
    var source: CLLocationCoordinate2D
    var destination: CLLocationCoordinate2D
    
    init(title: String, map: String, people: String, rating: String, level: String, source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        self.title = title
        self.map = map
        self.people = people
        self.rating = rating
        self.level = level
        self.source = source
        self.destination = destination
    }
}
