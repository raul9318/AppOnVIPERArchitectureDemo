//
//  FriendsListWireframeInput.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

protocol FriendsListWireFrameInput: class {
    var controller: FriendsListViewController? { get set }
    static func createModule() -> UIViewController?
    func presentAddInterface()
    func showFriendDetailInterfaceFor(_ friend: Friend)
}
