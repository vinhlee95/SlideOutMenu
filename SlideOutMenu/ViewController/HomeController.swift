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
    private let menuViewController = MenuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupMenuController()
        setupPanGesture()
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
        isMenuOpen = true
        animate(transform: CGAffineTransform(translationX: menuWidth, y: 0))
    }
    
    @objc func handleHide() {
        isMenuOpen = false
        animate(transform: .identity)
    }
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var x = translation.x
        // If menu is open and we swipe in backward direction
        // x value is < 0 so it causes the menu to collapse imminently without
        // any animation (x is reset to 0 due to x=max(0,x)
        if isMenuOpen {
            x += menuWidth
        }
        // Prevent from swiping to value that is over menu width
        x = min(menuWidth, x)
        // Prevent from swiping in right-left direction
        x = max(0, x)
        if sender.state == .changed {
            handlePanChanged(transform: CGAffineTransform(translationX: x, y: 0))
        } else if sender.state == .ended {
            handlePanEnded(translation: translation)
        }
    }
    
    fileprivate let menuWidth: CGFloat = 300
    fileprivate var isMenuOpen = false
    fileprivate func handlePanChanged(transform: CGAffineTransform) {
        menuViewController.view.transform = transform
        navigationController?.view.transform = transform
    }
    
    fileprivate func handlePanEnded(translation: CGPoint) {
        if translation.x >= menuWidth/2 {
            handleOpen()
        } else {
            handleHide()
        }
    }
    
    fileprivate func animate(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            // Final position of the menu view after animating
            self.menuViewController.view.transform = transform
//            self.view.transform = transform
            self.navigationController?.view.transform = transform
        }, completion: nil)
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    fileprivate func setupMenuController() {
        let keyWindow = UIApplication.shared.keyWindow
        keyWindow?.addSubview(menuViewController.view)
        addChild(menuViewController)
    }
    
    fileprivate func setupPanGesture() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
}

