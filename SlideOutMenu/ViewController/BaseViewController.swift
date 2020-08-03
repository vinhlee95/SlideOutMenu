//
//  BaseViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/29/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var homeViewContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    let menuViewContainer: UIView = {
        let v = UIView()
        return v
    }()
    
    let overlayView: UIView = {
        let v = UIView()
        v.alpha = 0
        v.backgroundColor = UIColor(white: 0, alpha: 0.8)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupPanGesture()
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        var x = translation.x
        x = isMenuOpen ? x + menuWidth : x
        x = min(x, menuWidth)
        x = max(0, x)
        homeViewContainerLeadingConstraint.constant = x
        
        overlayView.alpha = x/menuWidth
        
        if gesture.state == .ended {
            handleGestureEnded(gesture: gesture)
        }
    }
    
    fileprivate func handleGestureEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        if isMenuOpen {
            if abs(translation.x) > menuWidth/2 {
                closeMenu()
            } else {
                openMenu()
            }
            
            if(abs(velocity.x) > velocityXThreshold) {
                closeMenu()
            }
        } else {
            if translation.x > menuWidth/2 {
                openMenu()
            } else {
                closeMenu()
            }
            
            if(abs(velocity.x) > velocityXThreshold) {
                openMenu()
            }
        }
               
        animate()
    }
    
    fileprivate func openMenu() {
        homeViewContainerLeadingConstraint.constant = menuWidth
        isMenuOpen = true
    }
    
    fileprivate func closeMenu() {
        homeViewContainerLeadingConstraint.constant = 0
        isMenuOpen = false
    }
    
    fileprivate func animate() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.overlayView.alpha = self.isMenuOpen ? 1 : 0
        }, completion: nil)
    }
    
    var homeViewContainerLeadingConstraint: NSLayoutConstraint!
    fileprivate let menuWidth: CGFloat = 300
    fileprivate let velocityXThreshold: CGFloat = 400
    fileprivate var isMenuOpen = false
    
    fileprivate func setupViews() {
        view.addSubview(homeViewContainer)
        homeViewContainer.anchor(top: view.topAnchor, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        self.homeViewContainerLeadingConstraint = homeViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        self.homeViewContainerLeadingConstraint.isActive = true
        
        view.addSubview(menuViewContainer)
        menuViewContainer.anchor(top: view.topAnchor, leading: nil, bottom: homeViewContainer.bottomAnchor, trailing: homeViewContainer.safeAreaLayoutGuide.leadingAnchor)
        menuViewContainer.widthAnchor.constraint(equalToConstant: menuWidth).isActive = true
        
        view.addSubview(overlayView)
        overlayView.anchor(top: homeViewContainer.topAnchor, leading: homeViewContainer.leadingAnchor, bottom: homeViewContainer.bottomAnchor, trailing: homeViewContainer.trailingAnchor)
        
        setupViewControllers()
    }
    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGesture)
    }
    
    fileprivate func setupViewControllers() {
        let homeController = HomeController()
        let homeView = homeController.view!
        homeViewContainer.addSubview(homeView)
        homeView.anchor(top: homeViewContainer.topAnchor, leading: homeViewContainer.leadingAnchor, bottom: homeViewContainer.bottomAnchor, trailing: homeViewContainer.trailingAnchor)
        addChild(homeController)
        
        let menuController = MenuViewController()
        let menuView = menuController.view!
        menuView.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        menuViewContainer.addSubview(menuView)
        menuView.anchor(top: menuViewContainer.topAnchor, leading: menuViewContainer.leadingAnchor, bottom: menuViewContainer.bottomAnchor, trailing: menuViewContainer.trailingAnchor)
        addChild(menuController)
    }
}
