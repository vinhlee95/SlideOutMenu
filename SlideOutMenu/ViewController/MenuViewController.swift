//
//  MenuViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/22/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    private let rowNumber = 5
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNumber
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "Menu item: \(indexPath.row)"
        return cell
    }
}
