//
//  FriendsListPresenter.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class FriendsListPresenter: NSObject {
    weak var view: FriendsListViewInterface?
    var friendsListInteractor: FriendsListInteractorInput?
    var router: FriendsListWireFrameInput?
}

// MARK: - FriendsListModuleInterface
extension FriendsListPresenter: FriendsListModuleInterface {
    func updateDisplayData() {
        friendsListInteractor?.fetchDataOfFriends()
    }
    
    func presentAddFriendScreen() {
        router?.presentAddInterface()
    }
    
    func showFriendDetailScreenFor(friend: Friend) {
        router?.showFriendDetailInterfaceFor(friend)
    }
}

extension FriendsListPresenter: FriendsListInteractorOutput {
    func receivedDataOfFrieds(_ friends: [Friend]) {
        guard friends.count > 0 else {
            view?.showNoDataScreen()
            return
        }
        let upcomingDisplayData = FriendsListUpcomingDisplayData(items: friends)
        view?.showUpcomingDisplayData(upcomingDisplayData)
    }
}
