//
//  AddFriendRouter.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class AddFriendRouter: NSObject {
    weak var controller : AddFriendViewController?
}

// MARK: - AddFriendWireframeInput
extension AddFriendRouter: AddFriendWireframeInput {
    static func createModule() -> UIViewController? {
        let navigationController = UIStoryboard(name: "AddFriend", bundle: nil).instantiateViewController(withIdentifier: "AddFriendNavigationController")
        guard let view = navigationController.childViewControllers.first as? AddFriendViewController else {
            return UIViewController()
        }
        
        let presenter = AddFriendPresenter()
        let interactor = AddFriendInteractor()
        let router = AddFriendRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.controller = view
        
        return navigationController
    }
    
    func dismissModule() {
        view?.dismiss(animated: true, completion: nil)
    }
}
