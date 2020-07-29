//
//  BaseViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/29/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let redView: UIView = {
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
        view.backgroundColor = .yellow
        
        setupViews()
        setupPanGesture()
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        x = min(x, menuWidth)
        redViewLeadingConstraint.constant = x
    }
    
    var redViewLeadingConstraint: NSLayoutConstraint!
    fileprivate let menuWidth: CGFloat = 300
    
    fileprivate func setupViews() {
        view.addSubview(redView)
        redView.anchor(top: view.topAnchor, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        self.redViewLeadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        self.redViewLeadingConstraint.isActive = true
        
        view.addSubview(blueView)
        blueView.anchor(top: view.topAnchor, leading: nil, bottom: view.bottomAnchor, trailing: redView.leadingAnchor)
        blueView.widthAnchor.constraint(equalToConstant: menuWidth).isActive = true
    }
    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGesture)
    }
}
