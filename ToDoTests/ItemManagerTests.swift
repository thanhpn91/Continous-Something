//
//  ItemManagerTest.swift
//  ToDo
//
//  Created by Thanh Pham on 7/16/16.
//  Copyright © 2016 Siclo. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemManagerTests: XCTestCase {
    var itemManager: ItemManager!
    
    override func setUp() {
        super.setUp()
         itemManager = ItemManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatToDoCount_Initially_ShouldBeZero() {
        XCTAssertEqual(itemManager.toDoCount, 0)
    }
    
    func testThatDoneCount_Initially_ShouldBeZero() {
        XCTAssertEqual(itemManager.doneCount, 0)
    }
    
    func testThatToDoCount_AfterAddingOneItem_IsOne() {
        let toDoItem = ToDoItem(title: "Test item")
        itemManager.addItem(toDoItem)
        
        XCTAssertEqual(itemManager.toDoCount, 1)
    }
    
    func testThatItemAtIndex_ShouldReturnItem() {
        let toDoItem = ToDoItem(title: "Test item")
        itemManager.addItem(toDoItem)
        
        let item = itemManager.itemAtIndex(0)
        XCTAssertEqual(item?.title, toDoItem.title)
    }
    
    func testThatCheckingItem_ShouldChangesToDoCountAndDoneCount() {
        let toDoItem = ToDoItem(title: "Test item")
        itemManager.addItem(toDoItem)
        itemManager.checkItemAtIndex(0)
        
        XCTAssertEqual(itemManager.toDoCount, 0)
        XCTAssertEqual(itemManager.doneCount, 1)
    }
    
    func testThatCheckItem_ShouldRemoveItFromToDoItemList() {
        let firstToDoItem = ToDoItem(title: "Test first item")
        let secondToDoItem = ToDoItem(title: "Test second item")
        
        itemManager.addItem(firstToDoItem)
        itemManager.addItem(secondToDoItem)
        itemManager.checkItemAtIndex(0)
        
        XCTAssertEqual(itemManager.itemAtIndex(0)?.title, secondToDoItem.title)
    }
    
    func testThatDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem() {
        let toDoItem = ToDoItem(title: "Test item")
        itemManager.addItem(toDoItem)
        itemManager.checkItemAtIndex(0)
        
        let doneItem = itemManager.doneItemAtIndex(0)
        XCTAssertEqual(doneItem!.title, toDoItem.title)
    }
    
    func testThatRemoveAllItems_ShouldResultInCountsBeZero() {
        let firstToDoItem = ToDoItem(title: "Test first item")
        let secondToDoItem = ToDoItem(title: "Test second item")
        
        itemManager.addItem(firstToDoItem)
        itemManager.addItem(secondToDoItem)
        
        itemManager.removeAllItems()
        
        XCTAssertEqual(itemManager.toDoCount, 0)
        XCTAssertEqual(itemManager.doneCount, 0)
    }
    
    func testThatAddingTheSameItem_DoesNotIncreaseCount() {
        let toDoItem = ToDoItem(title: "Test item")
        
        itemManager.addItem(toDoItem)
        itemManager.addItem(toDoItem)
        
        XCTAssertEqual(itemManager.toDoCount, 1)
    }
}
