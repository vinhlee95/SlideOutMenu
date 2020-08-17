//
//  ChatRoomMenuController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/17/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class ChatRoomMenuController: UITableViewController {
    private let cellId = "cellId"
    private let data = [
        ["generals", "introductions"],
        ["jobs"],
        ["Ronaldo", "Federer", "Nadal"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Unreads"
        case 1:
            return "Channels"
        case 2:
            return "Direct messages"
        default:
            return ""
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }
}
