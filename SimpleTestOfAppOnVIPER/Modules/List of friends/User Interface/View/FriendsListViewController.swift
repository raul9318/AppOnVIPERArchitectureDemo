//
//  FriendsListViewController.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController {
    
    @IBAction func addButtonAction(_ sender: Any) {
        presenter?.presentAddFriendScreen()
    }
    @IBOutlet var noDataView: UIView!
    @IBOutlet var tableView: UITableView!
    var strongTableView: UITableView?
    
    var dataForDisplay: FriendsListUpcomingDisplayData?
    var presenter: FriendsListModuleInterface?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        strongTableView = tableView
        
        view = strongTableView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.updateDisplayData()
    }

}

// MARK: - FriendsListViewInterface
extension FriendsListViewController: FriendsListViewInterface {
    func showUpcomingDisplayData(_ data: FriendsListUpcomingDisplayData) {
        dataForDisplay = data
        view = strongTableView
        tableView.reloadData()
    }
    
    func showNoDataScreen() {
        view = noDataView
    }
}

// MARK: - TableView delegate and data source
extension FriendsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = dataForDisplay?.items.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = dataForDisplay?.items else {
            return UITableViewCell()
        }
        
        let friend = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = "Возраст: \(friend.age)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let items = dataForDisplay?.items else {
            return
        }
        
        let friend = items[indexPath.row]
        presenter?.showFriendDetailScreenFor(friend: friend)
    }
}

