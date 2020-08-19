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
        setupViews()
    }
    
    fileprivate func setupViews() {
        let searchView = SearchController().view!
        view.addSubview(searchView)
        searchView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: 150))
        
        let chatroomMenuView = chatroomMenuViewController.view!
        view.addSubview(chatroomMenuView)
        chatroomMenuView.anchor(top: searchView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
