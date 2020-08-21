//
//  ChatroomMenuContainer.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/19/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class ChatroomMenuContainer: UIViewController {
    fileprivate let chatroomMenuViewController = ChatRoomMenuController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
        setupViews()
    }
    
    fileprivate func setupViews() {
        let searchContainer = SearchContainerController()
        let searchView = searchContainer.view!
        view.addSubview(searchView)
        searchView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        
        let chatroomMenuView = chatroomMenuViewController.view!
        view.addSubview(chatroomMenuView)
        chatroomMenuView.anchor(top: searchView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        searchContainer.textField.delegate = chatroomMenuViewController
    }
}
