//
//  AddFriendInteractorIO.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

protocol AddFriendInteractorInput {
    func saveFriendWith(name: String, age: Int)
}

protocol AddFriendInteractorOutput: class {
    func friendSaved()
    func saveWithError() // TODO: error enum
}
