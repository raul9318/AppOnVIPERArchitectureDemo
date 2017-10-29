//
//  FriendsDataManager.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class FriendsDataManager {
    static let shared = FriendsDataManager()
    private init() {}
    
    fileprivate var _data = [Friend]()
}

extension FriendsDataManager {
    var allfriends: [Friend] {
        return _data
    }

    func addFriendWith(name: String, age: Int) {
        let friend = Friend(name: name, age: age)
        _data.append(friend)
    }
    
    func removeFriendAt(index: Int) {
        if _data.indices.contains(index) {
            _data.remove(at: index)
        }
    }
}

