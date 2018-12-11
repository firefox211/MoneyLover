//
//  MainViewController.swift
//  MoneyLover
//
//  Created by Maxim Yevtuhivskiy on 11/23/18.
//  Copyright © 2018 Lampa. All rights reserved.
//

import UIKit

protocol MainViewControllerProtocol: class {
    func showActionAlert(msg: String)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var navBarContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenterProtocol!
    
    var navView = NavView.fromNib()
    var headerForTableView = MainHeaderView.fromNib()
    
    let headerHeight: CGFloat = 279.0
    let cellHeight: CGFloat = 85.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = MainPresenter(view: self)
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupTableHeaderView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupViews() {
        setupNavBar()
        setupTableHeaderView()
        setupTableView()
    }
    
    func setupNavBar() {
        presenter.configurateNavView(navView)
        navBarContainer.addSubview(navView)
        navBarContainer.constrainToEdges(navView)
    }
    
    func setupTableHeaderView() {
        tableView.tableHeaderView = headerForTableView
        presenter.configurateHeaderView(headerForTableView)
        tableView.tableHeaderView?.frame.size.height = headerHeight
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: MainTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.tableFooterView = UIView()
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //TODO:
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as! MainTableViewCell
        
        presenter.configurateCell(cell, indexPath: indexPath)
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message: String = "Cell selected (row) = " + String(indexPath.row)
        self.showActionAlert(msg: message)
    }
}


extension MainViewController: MainViewControllerProtocol {
    
}
