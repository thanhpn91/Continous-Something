//
//  LocationTest.swift
//  ToDo
//
//  Created by Thanh Pham on 7/16/16.
//  Copyright © 2016 Siclo. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDo

class LocationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testThatInit_ShouldTakeName() {
        let location = Location(name: "Test location")
        XCTAssertNotNil(location)
    }
    
    func testThatInit_ShouldTakeNameAndCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1.0, longitude: 1.0)
        let location = Location(name: "Test location", coordinate: coordinate)
        XCTAssertNotNil(location)
    }
    
    func testThatLocationHasSameName_ShouldBeEqual() {
        let firstLocation = Location(name: "Home")
        let secondLocation = Location(name: "Home")
        
        XCTAssertEqual(firstLocation, secondLocation)
    }
    
    func testThatLocationHasDifferenceName_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties("Home", secondName: "Work", firstLongLat: nil, secondLongLat: nil)
    }
    
    func testThatWhenLattitudeDifferes_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties("Home", secondName: "Home", firstLongLat: (1.0, 0.0), secondLongLat: (0.0, 0.0))
    }
    
    func testThatWhenLongtitudeDifferes_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties("Home", secondName: "Home", firstLongLat: (0.0, 1.0), secondLongLat: (0.0, 0.0))
    }
    
    func testWhenOneHasCoordinateAndOtherDoesNot_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties("Home", secondName: "Home", firstLongLat: (1.0, 0.0), secondLongLat: nil)
    }
    
    func performNotEqualTestWithLocationProperties(firstName: String, secondName: String, firstLongLat: (Double, Double)?, secondLongLat: (Double, Double)?) {
        
        let firstCoord: CLLocationCoordinate2D?
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        } else {
            firstCoord = nil
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        let secondCoord: CLLocationCoordinate2D?
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        } else {
            secondCoord = nil
        }
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
}