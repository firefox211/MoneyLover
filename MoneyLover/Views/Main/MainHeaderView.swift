//
//  MainHeaderView.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import UIKit

protocol MainHeaderViewProtocol {
    func display(paymentName: String?)
    func display(email: String?)
    func display(balance: String?)
    func display(date: String?)
    var buttonHandler: (() -> Void)? { get set }
}

class MainHeaderView: UIView {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var leftDarkView: UIView!
    @IBOutlet weak var rightDarkView: UIView!
    @IBOutlet weak var paymentView: UIView!
    @IBOutlet weak var paymentNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var roundViewHeightConst: NSLayoutConstraint!
    
    var buttonHandler: (() -> Void)?
    
    var isBlackCard: Bool = false
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let cardViewHorizontalSpaces: CGFloat = 64
    
    let maxViewScale: CGFloat = 2.5
    let duration: TimeInterval = 0.5
 
    let purpleColor = UIColor.hex(ColorScheme.kPurpleView)
    let blackColor = UIColor.hex(ColorScheme.kBlackView)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
        resetContent()
    }
    
    class func fromNib() -> MainHeaderView {
        return UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MainHeaderView
    }
    
    func setupViews() {
        setupCorners()
        setupRoundView()
    }
    
    func resetContent() {
        paymentNameLabel.text = nil
        emailLabel.text = nil
        balanceLabel.text = nil
        dateLabel.text = nil
    }
   
    func setupCorners() {
        cardView.viewCorner(8)
        leftDarkView.viewCorner(5)
        rightDarkView.viewCorner(5)
        paymentView.viewCorner(5)
    }
    
    func setupRoundView() {
        
        let cardViewWidth: CGFloat = screenWidth - cardViewHorizontalSpaces
       
        roundViewHeightConst.constant = cardViewWidth 
        
        roundView.viewCorner(cardViewWidth / 2)
        roundView.backgroundColor = isBlackCard ? blackColor : purpleColor
        
        roundView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
    }
    
    func showRoundView() {
        
        self.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: self.duration, delay: 0, options: .curveEaseInOut, animations: {
            self.roundView.transform = CGAffineTransform(scaleX: self.maxViewScale, y: self.maxViewScale)
            
        }, completion: { _ in
            self.isBlackCard = !self.isBlackCard
            self.setupRoundView()
            
            self.cardView.backgroundColor = self.isBlackCard ? self.purpleColor : self.blackColor
            
            self.isUserInteractionEnabled = true
        })
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        //TODO: Uncomment for show message
//        buttonHandler?()
        
        showRoundView()
    }
    
}

extension MainHeaderView: MainHeaderViewProtocol {
    
    func display(paymentName: String?) {
        paymentNameLabel.text = paymentName
    }
    
    func display(email: String?) {
        emailLabel.text = email
    }
    
    func display(balance: String?) {
        balanceLabel.text = balance
    }
    
    func display(date: String?) {
        dateLabel.text = date
    }
    
}
