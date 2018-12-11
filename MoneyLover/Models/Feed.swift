//
//  File.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import Foundation

class Feed {
    
    var avatar: String?
    var userName: String?
    var userDescription: String?
    var money: String?
    var isStrikeMoney: Bool?
    
    init(avatar: String?, userName: String?, userDescription: String?, money: String?, isCrossOutMoney: Bool?) {
        self.avatar = avatar
        self.userName = userName
        self.userDescription = userDescription
        self.money = money
        self.isStrikeMoney = isCrossOutMoney
    }
    
}
