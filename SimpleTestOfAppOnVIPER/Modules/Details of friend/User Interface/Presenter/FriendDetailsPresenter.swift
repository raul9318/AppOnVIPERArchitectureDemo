//
//  FriendDetailsPresenter.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class FriendDetailsPresenter: NSObject {
    weak var view: FriendDetailsViewInterface?
    var interactor: FriendDetailsInteractorInput?
    var router: FriendDetailsWireframeInput?
}

extension FriendDetailsPresenter: FriendDetailsModuleInterface {
    func updateDisplayData() {
        interactor?.getFriendData()
    }
    
    func deleteFriend() {
        interactor?.deleteFriend()
    }
}

extension FriendDetailsPresenter: FriendDetailsInteractorOutput {
    func friendDeleted() {
        router?.dismissModule()
    }
    
    func friendData(name: String, age: Int) {
        view?.displayData(name: name, ageString: "\(age)")
    }
}
