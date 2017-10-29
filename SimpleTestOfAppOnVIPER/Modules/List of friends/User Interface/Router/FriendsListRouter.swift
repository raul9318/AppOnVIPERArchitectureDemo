//
//  FriendsListRouter.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class FriendsListRouter: NSObject {
    weak var controller: FriendsListViewController?
}

// MARK: - FriendsListWireFrameInput
extension FriendsListRouter: FriendsListWireFrameInput {
    static func createModule() -> UIViewController? {
        let navigationController = UIStoryboard(name: "ListOfFriendsStoryboard", bundle: nil).instantiateViewController(withIdentifier: "FriendsListNavigationController")
        guard let view = navigationController.childViewControllers.first as? FriendsListViewController else {
            return nil
        }
        
        let presenter = FriendsListPresenter()
        let interactor = FriendsListInteractor()
        let router = FriendsListRouter()
        
        view.presenter = presenter
        
        presenter.friendsListInteractor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.output = presenter
        
        return navigationController
    }
    
    func presentAddInterface() {
        
    }
    
    func showFriendDetailInterfaceFor(_ friend: Friend) {
        
    }
}
