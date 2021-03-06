//
//  MenuViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/22/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let label: String
}

class MenuViewController: UITableViewController {
    private let cellId = "cellId"
    private let menuItems = [
        MenuItem(icon: #imageLiteral(resourceName: "profile"), label: "Home"),
        MenuItem(icon: #imageLiteral(resourceName: "lists"), label: "Lists"),
        MenuItem(icon: #imageLiteral(resourceName: "bookmarks"), label: "Bookmarks"),
        MenuItem(icon: #imageLiteral(resourceName: "moments"), label: "Moments"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MenuHeaderView()
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuItemCell(style: .default, reuseIdentifier: cellId)
        let menuItem = menuItems[indexPath.row]
        cell.menuLabel.text = menuItem.label
        cell.menuIcon.image = menuItem.icon
        return cell
    }
}

extension MenuViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let baseViewController = keyWindow?.rootViewController as! BaseViewController
        baseViewController.selectMenuItem(indexPath: indexPath)
    }
}
