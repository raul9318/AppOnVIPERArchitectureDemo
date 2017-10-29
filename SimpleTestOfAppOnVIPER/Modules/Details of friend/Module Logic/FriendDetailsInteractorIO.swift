//
//  FriendDetailsInteractorIO.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

protocol FriendDetailsInteractorInput {
    func getFriendData()
    func deleteFriend()
}

protocol FriendDetailsInteractorOutput: class {
    func friendDeleted()
    func friendData(name: String, age: Int)
}
