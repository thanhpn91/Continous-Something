//
//  ItemListDataProviderTests.swift
//  ToDo
//
//  Created by Thanh Pham on 7/18/16.
//  Copyright © 2016 Siclo. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListDataProviderTests: XCTestCase {
    
    var sut: ItemListDataProvider!
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        
        tableView = UITableView()
        tableView!.dataSource = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testThatNumberOfSections_IsTwo() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testThatNumberOfRowsInFirstSection_IsToDoCount() {
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 1)
    
        sut.itemManager?.addItem(ToDoItem(title: "Second"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 2)
    }
    
    func testThatNumberOfRowsInSecondSection_IsDoneCount() {
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        sut.itemManager?.addItem(ToDoItem(title: "Second"))
        
        sut.itemManager?.checkItemAtIndex(0)
        sut.itemManager?.checkItemAtIndex(0)
        
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRowsInSection(1), 2)
    }
    
    func testCellForRow_ReturnsIsItemCell() {
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        
        tableView.reloadData()
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
        
        XCTAssertTrue(cell is ItemCell)
    }
}
