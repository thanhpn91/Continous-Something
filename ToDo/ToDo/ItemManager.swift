//
//  ItemManager.swift
//  ToDo
//
//  Created by Thanh Pham on 7/16/16.
//  Copyright © 2016 Siclo. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count }
    private var toDoItems = [ToDoItem]()
    private var doneItems = [ToDoItem]()
    
    func addItem(todoItem: ToDoItem) {
        if !toDoItems.contains(todoItem) {
            toDoItems.append(todoItem)
        }
    }
    
    func itemAtIndex(index: Int) -> ToDoItem? {
        guard index < toDoItems.count else {
            return nil
        }
        return toDoItems[index]
    }
    
    func checkItemAtIndex(index: Int) {
        doneItems.append(toDoItems[index])
        toDoItems.removeAtIndex(index)
    }
    
    func doneItemAtIndex(index: Int) -> ToDoItem? {
        guard index < doneItems.count else {
            return nil
        }
        return doneItems[index]
    }
    
    func removeAllItems() {
        toDoItems.removeAll()
    }
}