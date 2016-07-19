//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Thanh Pham on 7/18/16.
//  Copyright © 2016 Siclo. All rights reserved.
//

import Foundation
import UIKit

class ItemListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: protocol<UITableViewDataSource, UITableViewDelegate>!
    
    override func viewDidLoad() {
        self.tableView.dataSource = dataProvider
        self.tableView.delegate = dataProvider
    }
}