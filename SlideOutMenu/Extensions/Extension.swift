//
//  Extension.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 7/29/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: paddingRight).isActive = true
        }
    }
}

extension UILabel {
    func addAttributeText(primaryText: String, secondaryText: String) {
        let attributedText = NSMutableAttributedString(string: primaryText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)])
        attributedText.append(NSAttributedString(string: secondaryText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
        self.attributedText = attributedText
    }
}
