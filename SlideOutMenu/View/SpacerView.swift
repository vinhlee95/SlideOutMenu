//
//  SpacerView.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/4/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class SpacerView: UIView {
    let space: CGFloat
    
    init(space: CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: space, height: space)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
