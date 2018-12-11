//
//  MainTabBarPresenter.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import Foundation

protocol MainTabBarPresenterProtocol {
    init(view: MainTabBarViewControllerProtocol)
}

class MainTabBarPresenter: MainTabBarPresenterProtocol {
    
    private unowned let view: MainTabBarViewControllerProtocol
    
    required init(view: MainTabBarViewControllerProtocol) {
        self.view = view
    }
}
