//
//  ProfileImageView.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/5/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class ProfileImageView: UIImageView {
    let width: CGFloat
    let height: CGFloat

    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        super.init(frame: .zero)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: width, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
