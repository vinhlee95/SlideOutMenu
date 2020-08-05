//
//  MenuHeaderView.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/4/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
    var profileImageView: UIImageView = {
        let v = ProfileImageView(width: 48, height: 48)
        v.image = UIImage(named: "vinh")
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 48/2
        v.layer.masksToBounds = true
        return v
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Vinh Le"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "@vinhlee95"
        return label
    }()
    
    var followingLabel: UILabel = {
        let label = UILabel()
        label.addAttributeText(primaryText: "2020", secondaryText: " Following")
        return label
    }()
    
    var followerLabel: UILabel = {
        let label = UILabel()
        label.addAttributeText(primaryText: "  2020", secondaryText: " Followers")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupStackView() {
        let view = UIView()
        view.backgroundColor = .red
        let photoStackView = UIStackView(arrangedSubviews: [profileImageView, view])
        let statsStackView = UIStackView(arrangedSubviews: [followingLabel, followerLabel])
        let stackView = UIStackView(arrangedSubviews: [photoStackView, nameLabel, nicknameLabel, SpacerView(space: 16), statsStackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24)
        self.addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
}
