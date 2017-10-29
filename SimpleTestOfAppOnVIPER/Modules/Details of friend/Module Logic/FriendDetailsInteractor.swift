//
//  FriendDetailsInteractor.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class FriendDetailsInteractor: NSObject {
    weak var output: FriendDetailsInteractorOutput?
    
    var friend: Friend?
    
    convenience init(friend: Friend) {
        self.init()
        self.friend = friend
    }
}

// MARK: - FriendDetailsInteractorInput
extension FriendDetailsInteractor: FriendDetailsInteractorInput {
    func getFriendData() {
        guard let friend = friend else {
            return
        }
        
        output?.friendData(name: friend.name, age: friend.age)
    }
    
    func deleteFriend() {
        guard let friend = friend else {
            return
        }
        FriendsDataManager.shared.remove(friend: friend)
        output?.friendDeleted()
    }
}
