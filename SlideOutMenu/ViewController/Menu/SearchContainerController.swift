//
//  SearchController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/19/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class SearchContainerController: UIViewController {
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "rocket")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 3
        iv.clipsToBounds = true
        return iv
    }()
    
    let textField: UISearchBar = {
        let sb = UISearchBar()
        sb.searchTextField.textColor = .white
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2703397038, green: 0.1764705882, blue: 0.2299149024, alpha: 1)
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, paddingLeft: 8, paddingBottom: 12, size: .init(width: 32 , height: 32))
        
        view.addSubview(textField)
        textField.anchor(top: nil, leading: logoImageView.trailingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
