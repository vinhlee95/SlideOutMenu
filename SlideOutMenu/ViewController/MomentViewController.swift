//
//  MomentViewController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/14/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class MomentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Moments"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.tabBarItem.title = "Moments"
        navigationController?.tabBarItem.image = #imageLiteral(resourceName: "moments")
    }
}
