//
//  AddFriendPresenter.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class AddFriendPresenter: NSObject {
    weak var view: AddFriendViewInterface?
    var interactor: AddFriendInteractorInput?
    var router: AddFriendWireframeInput?
}

extension AddFriendPresenter: AddFriendModuleInterface {
    func saveFriendWith(name: String, age: Int) {
        interactor?.saveFriendWith(name: name, age: age)
    }
    
    func dismissModule() {
        router?.dismissModule()
    }
}

extension AddFriendPresenter: AddFriendInteractorOutput {
    func friendSaved() {
        view?.showSaveDoneAlert()
    }
    
    func saveWithError() {
        view?.showNameErrorAlert()
    }
}
