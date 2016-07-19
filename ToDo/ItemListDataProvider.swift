//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Thanh Pham on 7/18/16.
//  Copyright © 2016 Siclo. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    enum Section: Int {
        case Todo
        case Done
    }
    
    var itemManager: ItemManager?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else {
            return 0
        }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        switch itemSection {
            case .Todo:
                return itemManager.toDoCount
            case .Done:
                return itemManager.doneCount
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return ItemCell()
    }
}

