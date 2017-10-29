//
//  AddFriendInteractor.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class AddFriendInteractor: NSObject {
    weak var output: AddFriendInteractorOutput?
}

// MARK: - AddFriendInteractorInput
extension AddFriendInteractor: AddFriendInteractorInput {
    func saveFriendWith(name: String, age: Int) {
        guard !name.isEmpty else {
            // TODO: enum error
            output?.saveWithError()
            return
        }
        
        FriendsDataManager.shared.addFriendWith(name: name, age: age)
        output?.friendSaved()
    }
}
