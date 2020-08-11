//
//  MenuItemCell.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/11/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell {
    let menuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Hi"
        return label
    }()
    
    let menuIcon: UIImageView = {
        let iv = ProfileImageView(width: 38, height: 38)
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "profile")
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stackView = UIStackView(arrangedSubviews: [menuIcon, menuLabel, UIView()])
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
