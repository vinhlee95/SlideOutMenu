//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/21/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    private let rowNumber = 5
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNumber
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
    @objc func handleOpen() {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let baseViewController = keyWindow?.rootViewController as! BaseViewController
        baseViewController.openMenu()
    }
    
    @objc func handleHide() {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let baseViewController = keyWindow?.rootViewController as! BaseViewController
        baseViewController.closeMenu()
    }
    
    fileprivate func setupNavigationItems() {
       navigationItem.title = "Home"
       navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
}
