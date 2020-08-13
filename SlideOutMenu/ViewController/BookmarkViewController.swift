//
//  BookmarkViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/13/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class BookmarkViewController: UITableViewController {
    private let rowNumber = 5
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNumber
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Bookmark \(indexPath.row)"
        return cell
    }
}
