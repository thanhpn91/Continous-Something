//
//  ToDoItemTests.swift
//  ToDo
//
//  Created by Thanh Pham on 7/15/16.
//  Copyright © 2016 Siclo. All rights reserved.
//


import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatInit_ShouldTakeTitle() {
        let item = ToDoItem(title: "Test title")
        
        XCTAssertNotNil(item)
    }
    
    func testThatInit_ShouldTakeTitleAndDescription() {
        let item = ToDoItem(title: "Test title", itemDescription: "Test description")
        
        XCTAssertNotNil(item)
    }
    
    func testThatInit_ShouldTakeTitleAndDescriptionAndTimestamp() {
        let item = ToDoItem(title: "Test title", itemDescription: "Test description", timeStamp: 0.0)
        
        XCTAssertNotNil(item)
    }
    
    func testThatInit_ShouldTakeTitleAndDescriptionAndTimeStampAndLocation() {
        let location = Location(name: "Test name")
        let item = ToDoItem(title: "Test title", itemDescription: "Test description", timeStamp: 0.0, location: location)
        
        XCTAssertNotNil(item)
    }
    
    func testThatEqualItem_ShouldBeEqual() {
        let firstItem = ToDoItem(title: "Test")
        let secondItem = ToDoItem(title: "Test")
        
        XCTAssertEqual(firstItem, secondItem)
    }
    
    func testThatWhenOneLocationIsNilAndOtherIsNot_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "Test title", itemDescription: "Test description", timeStamp: 0.0, location: Location(name: "Test name"))
        
        let secondItem = ToDoItem(title: "Test title", itemDescription: "Test description", timeStamp: 0.0, location: nil)
        
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testThatTimeStampDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "Test title", itemDescription: "Test description", timeStamp: 1.0, location: nil)
        
        let secondItem = ToDoItem(title: "Test title", itemDescription: "Test description", timeStamp: 0.0, location: nil)
        
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testThatDesciptionDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "Test title", itemDescription: "First Test description ", timeStamp: 1.0, location: nil)
        
        let secondItem = ToDoItem(title: "Test title", itemDescription: "Test description", timeStamp: 0.0, location: nil)
        
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testThatTitleDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First Test")
        let secondItem = ToDoItem(title: "Test")
        
        XCTAssertNotEqual(firstItem, secondItem)
    }
}
