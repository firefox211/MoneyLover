//
//  MainTableViewCell.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import UIKit

protocol MainTableViewCellProtocol {
    func display(avatar: UIImage?)
    func display(userName: String?)
    func display(description: String?)
    func display(money: String?, isStrike: Bool?)
}

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    let redColor = UIColor.hex(ColorScheme.kRedText)
    let greenColor = UIColor.hex(ColorScheme.kGreenText)
    let greyColor = UIColor.hex(ColorScheme.kGreyText)
     
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
        resetContent()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        resetContent()
    }
    
    func setupViews() {
        setupCorners()
    }
    
    func resetContent() {
        avatarImageView.image = nil
        userNameLabel.text = nil
        descriptionLabel.text = nil
        moneyLabel.text = nil
    }
    
    func setupCorners() {
        containerView.viewCorner(3)
        avatarImageView.viewCorner()
    }
    
}

extension MainTableViewCell: MainTableViewCellProtocol {
    
    func display(avatar: UIImage?) {
        avatarImageView.image = avatar
    }
    
    func display(userName: String?) {
        userNameLabel.text = userName
    }
    
    func display(description: String?) {
        descriptionLabel.text = description
    }
    
    func display(money: String?, isStrike: Bool?) {
        
        guard let moneyStr = money else { return }
        
        let attributeString = NSMutableAttributedString(string: moneyStr)
        
        if let isStrikeText = isStrike, isStrikeText {
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
            moneyLabel.textColor = greyColor
        } else {
            moneyLabel.textColor = moneyStr.contains("-") ? redColor : greenColor
        }
        
        moneyLabel.attributedText = attributeString
    }
    
}
