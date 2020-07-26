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
    
    let menuViewController = MenuViewController()
    @objc func handleOpen() {
        let keyWindow = UIApplication.shared.keyWindow
        keyWindow?.addSubview(menuViewController.view)
        
        let menuWidth = view.frame.width * 3/4
        // Initial position of menu view
        menuViewController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            // Final position of the menu view after animating
            self.menuViewController.view.transform = CGAffineTransform(translationX: menuWidth, y: 0)
        }, completion: nil)
        
        addChild(menuViewController)
    }
    
    @objc func handleHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            // Final position of the menu view after animating
            self.menuViewController.view.transform = .identity
        }, completion: nil)
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
}

