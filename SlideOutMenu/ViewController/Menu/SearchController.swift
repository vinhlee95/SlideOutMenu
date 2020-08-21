//
//  SearchController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/19/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class SearchContainerController: UIViewController {
    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2703397038, green: 0.1764705882, blue: 0.2299149024, alpha: 1)
        
        view.addSubview(searchBar)
        searchBar.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
