//
//  ChatroomMenuCell.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/18/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class ChatroomMenuCell: UITableViewCell {
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.24391523, green: 0.4392609596, blue: 0.3185343444, alpha: 1)
        v.layer.cornerRadius = 4
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(bgView)
        bgView.fillSuperview(padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        sendSubviewToBack(bgView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bgView.isHidden = !selected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
