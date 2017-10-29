//
//  FriendsListInteractor.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class FriendsListInteractor: NSObject {
    weak var output: FriendsListInteractorOutput?
}

// MARK: - FriendsListInteractorInput
extension FriendsListInteractor: FriendsListInteractorInput {
    func fetchDataOfFriends() {
        // TODO: request for data
        let result: [Friend] = []
        output?.receivedDataOfFrieds(result)
    }
}
