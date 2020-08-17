//
//  BaseViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/29/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class HomeContainerView: UIView {}
class MenuContainerView: UIView {}
class OverlayView: UIView {}

class BaseViewController: UIViewController {
    private var mainViewController: UIViewController = UINavigationController(rootViewController: HomeController())
    
    var homeViewContainer: HomeContainerView = {
        let v = HomeContainerView()
        return v
    }()
    
    let menuViewContainer: MenuContainerView = {
        let v = MenuContainerView()
        return v
    }()
    
    let overlayView: OverlayView = {
        let v = OverlayView()
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
    
    @objc func handleClickOverlay() {
        closeMenu()
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
    }
    
     func openMenu() {
        homeViewContainerLeadingConstraint.constant = menuWidth
        isMenuOpen = true
        animate()
    }
    
     func closeMenu() {
        homeViewContainerLeadingConstraint.constant = 0
        isMenuOpen = false
        animate()
    }
    
    func selectMenuItem(indexPath: IndexPath) {
        removePreviousView()
        switch indexPath.row {
        case 0:
            mainViewController = UINavigationController(rootViewController: HomeController())
        case 1:
            mainViewController = UINavigationController(rootViewController: ListViewController())
        case 2:
            mainViewController = BookmarkViewController()
        case 3:
            let navigationController = UINavigationController(rootViewController: MomentViewController())
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [navigationController]
            mainViewController = tabBarController
        default:
            mainViewController = UINavigationController(rootViewController: HomeController())
        }
        
        appendSubView(view: mainViewController.view)
        addChild(mainViewController)
        closeMenu()
        homeViewContainer.bringSubviewToFront(overlayView)
    }
    
    fileprivate func removePreviousView() {
        mainViewController.view.removeFromSuperview()
        mainViewController.removeFromParent()
    }
    
    fileprivate func appendSubView(view: UIView) {
        homeViewContainer.addSubview(view)
        view.anchor(top: homeViewContainer.topAnchor, leading: homeViewContainer.leadingAnchor, bottom: homeViewContainer.bottomAnchor, trailing: homeViewContainer.trailingAnchor)
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
    
    //
    // Add Home and menu subViews to main view
    // - Setup Auto layout
    //
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
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleClickOverlay))
        overlayView.addGestureRecognizer(gesture)
        setupViewControllers()
    }
    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGesture)
    }
    
    //
    // Setup view controllers
    // Instantiate HomeViewController and MenuViewController
    // append their views to already setup Home and Menu view
    //
    fileprivate func setupViewControllers() {
        let homeView = mainViewController.view!
        homeViewContainer.addSubview(homeView)
        homeView.anchor(top: homeViewContainer.topAnchor, leading: homeViewContainer.leadingAnchor, bottom: homeViewContainer.bottomAnchor, trailing: homeViewContainer.trailingAnchor)
        addChild(mainViewController)
        
        let menuController = MenuViewController()
        let menuView = menuController.view!
        menuView.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        menuViewContainer.addSubview(menuView)
        menuView.anchor(top: menuViewContainer.topAnchor, leading: menuViewContainer.leadingAnchor, bottom: menuViewContainer.bottomAnchor, trailing: menuViewContainer.trailingAnchor)
        addChild(menuController)
    }
}
