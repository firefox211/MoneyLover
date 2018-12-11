//
//  MainPresenter.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import UIKit

protocol MainPresenterProtocol {
    init(view: MainViewControllerProtocol)
    func configurateNavView(_ navView: NavViewProtocol)
    func configurateHeaderView(_ header: MainHeaderViewProtocol)
    func configurateCell(_ cell: MainTableViewCellProtocol, indexPath: IndexPath)
    func getNumberOfRowsInSection() -> Int
}

class MainPresenter: MainPresenterProtocol {
    
    private unowned let view: MainViewControllerProtocol
    
    required init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    //TODO: For test
    let feedArray: [Feed] = [
        Feed(avatar: "user1", userName: "Ubisoft INC", userDescription: "Pago", money: "-29,99", isCrossOutMoney: false),
        Feed(avatar: "user2", userName: "Danel Foster", userDescription: "Pago recibido", money: "+462,77", isCrossOutMoney: false),
        Feed(avatar: "user3", userName: "Abraham F.", userDescription: "Deuda Pagada", money: "328,42", isCrossOutMoney: true),
        Feed(avatar: "user5", userName: "Market", userDescription: "Pago", money: "-85,34", isCrossOutMoney: false),
        Feed(avatar: "user1", userName: "Ubisoft INC", userDescription: "Pago", money: "+49,99", isCrossOutMoney: false),
        Feed(avatar: "user2", userName: "Danel Foster", userDescription: "Pago recibido", money: "162,87", isCrossOutMoney: true),
        Feed(avatar: "user3", userName: "Abraham F.", userDescription: "Deuda Pagada", money: "2,42", isCrossOutMoney: true),
        Feed(avatar: "user5", userName: "Market", userDescription: "Pago", money: "+48,34", isCrossOutMoney: false)
    ]
    
    func configurateNavView(_ navView: NavViewProtocol) {
        
        var navView = navView
        
        //TODO: Change this. Use the values received from the server
        navView.display(avatar: UIImage(named: "user4"))
        navView.display(userName: "Carlos.")
        navView.display(paymentName: "Paypal")
        
        navView.buttonHandler = { [weak self] type in
            
            guard let `self` = self else { return }
            
            self.view.showActionAlert(msg: type.rawValue)
        }
    }
    
    func configurateHeaderView(_ header: MainHeaderViewProtocol) {
        
        var header = header
        
        //TODO: Change this. Use the values received from the server
        header.display(paymentName: "Paypal")
        header.display(email: "carlosesverde@gmail.com")
        header.display(balance: "$ 3,428.63")
        header.display(date: "(1/11/2017   12:59:58 PM)")
        
        header.buttonHandler = { [weak self] in
            
            guard let `self` = self else { return }
            
            self.view.showActionAlert(msg: "card")
        }
    }
    
    func configurateCell(_ cell: MainTableViewCellProtocol, indexPath: IndexPath) {
        
        guard let feed = feedArray[safe: indexPath.row] else { return }
         
        if let avatarStr = feed.avatar {
            let avatarImage = UIImage(named: avatarStr)
            cell.display(avatar: avatarImage)
        }
        
        cell.display(userName: feed.userName)
        cell.display(description: feed.userDescription)
        cell.display(money: feed.money, isStrike: feed.isStrikeMoney)
    }
    
    func getNumberOfRowsInSection() -> Int {
        return feedArray.count
    }
    
}
