//
//  NavView.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import UIKit

enum NavViewButtonType: String {
    case payment
    case notifications
    case settings
}

protocol NavViewProtocol {
    func display(avatar: UIImage?)
    func display(userName: String?)
    func display(paymentName: String?)
    var buttonHandler: ((_ type: NavViewButtonType) -> Void)? { get set }
}

class NavView: UIView {
    
    @IBOutlet weak var avatarContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var paymentView: UIView!
    @IBOutlet weak var paymentNameLabel: UILabel!
    
    var buttonHandler: ((_ type: NavViewButtonType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
        resetContent()
    }
    
    class func fromNib() -> NavView {
        return UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavView
    }
    
    func setupViews() {
        setupCorners()
    }
    
    func resetContent() {
        avatarImageView.image = nil
        userNameLabel.text = nil
        paymentNameLabel.text = nil
    }
    
    func setupCorners() {
        avatarContainerView.viewCorner()
        avatarImageView.viewCorner()
        paymentView.viewCorner()
    }
    
    @IBAction func paymentButtonClicked(_ sender: Any) {
        buttonHandler?(.payment)
    }
    
    @IBAction func notificationsButtonClicked(_ sender: Any) {
        buttonHandler?(.notifications)
    }
    
    @IBAction func settingsButtonClicked(_ sender: Any) {
        buttonHandler?(.settings)
    }
    
}

extension NavView: NavViewProtocol {
    
    func display(avatar: UIImage?) {
        avatarImageView.image = avatar
    }
    
    func display(userName: String?) {
        userNameLabel.text = userName
    }
    
    func display(paymentName: String?) {
        paymentNameLabel.text = paymentName
    }
}
