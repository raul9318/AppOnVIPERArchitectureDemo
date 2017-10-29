//
//  FriendDetailsViewController.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class FriendDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        presenter?.deleteFriend()
    }
    
    var presenter: FriendDetailsModuleInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.updateDisplayData()
    }

}

// MARK: - FriendDetailsViewInterface
extension FriendDetailsViewController: FriendDetailsViewInterface {
    func displayData(name: String, ageString: String) {
        nameLabel.text = name
        ageLabel.text = ageString
    }
}
