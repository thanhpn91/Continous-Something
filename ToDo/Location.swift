//
//  Location.swift
//  ToDo
//
//  Created by Thanh Pham on 7/16/16.
//  Copyright © 2016 Siclo. All rights reserved.
//

import Foundation
import CoreLocation

struct Location: Equatable {
    let name: String!
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

func ==(lhs: Location, rhs: Location) -> Bool {
    if lhs.name != rhs.name {
        return false
    }
    if lhs.coordinate?.latitude != rhs.coordinate?.latitude {
        return false
    }
    if lhs.coordinate?.longitude != rhs.coordinate?.longitude {
        return false
    }
    
    return true
}