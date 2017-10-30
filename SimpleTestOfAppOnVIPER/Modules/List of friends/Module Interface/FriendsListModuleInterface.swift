//
//  FriendsListModuleInterface.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

protocol FriendsListModuleInterface: class {
    var view: FriendsListViewInterface? { get set }
    var interactor: FriendsListInteractorInput? { get set }
    var router: FriendsListWireFrameInput? { get set }
    func updateDisplayData()
    func presentAddFriendScreen()
    func showFriendDetailScreenFor(friend: Friend)
}
