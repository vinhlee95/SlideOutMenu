//
//  BaseViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/29/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var redView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        return v
    }()
    
    let blueView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setupPanGesture()
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        x = isMenuOpen ? x + menuWidth : x
        x = min(x, menuWidth)
        x = max(0, x)
        redViewLeadingConstraint.constant = x
        
        if gesture.state == .ended {
            handleGestureEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleGestureEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        if translation.x > menuWidth / 2 {
            redViewLeadingConstraint.constant = menuWidth
            isMenuOpen = true
        } else {
            redViewLeadingConstraint.constant = 0
            isMenuOpen = false
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    var redViewLeadingConstraint: NSLayoutConstraint!
    fileprivate let menuWidth: CGFloat = 300
    fileprivate var isMenuOpen = false
    
    fileprivate func setupViews() {
        view.addSubview(redView)
        redView.anchor(top: view.topAnchor, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        self.redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        self.redViewLeadingConstraint.isActive = true
        
        view.addSubview(blueView)
        blueView.anchor(top: view.topAnchor, leading: nil, bottom: redView.bottomAnchor, trailing: redView.safeAreaLayoutGuide.leadingAnchor)
        blueView.widthAnchor.constraint(equalToConstant: menuWidth).isActive = true
        
        setupViewControllers()
    }
    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGesture)
    }
    
    fileprivate func setupViewControllers() {
        let homeController = HomeController()
        let homeView = homeController.view!
        redView.addSubview(homeView)
        homeView.anchor(top: redView.topAnchor, leading: redView.leadingAnchor, bottom: redView.bottomAnchor, trailing: redView.trailingAnchor)
        addChild(homeController)
        
        let menuController = MenuViewController()
        let menuView = menuController.view!
        menuView.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        blueView.addSubview(menuView)
        menuView.anchor(top: blueView.topAnchor, leading: blueView.leadingAnchor, bottom: blueView.bottomAnchor, trailing: blueView.trailingAnchor)
        addChild(menuController)
    }
}
