//
//  FriendsListViewInterface.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

protocol FriendsListViewInterface: class {
    var presenter: FriendsListModuleInterface? { get set }
    func showUpcomingDisplayData(_ data: FriendsListUpcomingDisplayData)
    func showNoDataScreen()
}
