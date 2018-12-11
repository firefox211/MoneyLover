//
//  MainTabBarViewController.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import UIKit
  
protocol MainTabBarViewControllerProtocol: class {
    
}

class MainTabBarViewController: UITabBarController {
    
    var presenter: MainTabBarPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = MainTabBarPresenter(view: self)
    }
    
}

extension MainTabBarViewController: MainTabBarViewControllerProtocol {
    
}
