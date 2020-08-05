//
//  MenuHeaderView.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/4/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
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
    
    var statsLabel: UILabel = {
        let label = UILabel()
        label.text = "2020 followers"
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
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nicknameLabel, SpacerView(space: 32), statsLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24)
        self.addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
}
