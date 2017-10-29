//
//  FriendDetailsRouter.swift
//  SimpleTestOfAppOnVIPER
//
//  Created by Рамиль Ибрагимов on 29.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class FriendDetailsRouter: NSObject {
    weak var controller: UIViewController?
}

// MARK: - FriendDetailsWireframeInput
extension FriendDetailsRouter: FriendDetailsWireframeInput {
    
    static func createModule(with friend: Friend) -> UIViewController? {
        guard let controller = UIStoryboard(name: "FriendDetails", bundle: nil).instantiateViewController(withIdentifier: "FriendDetailsViewController") as? FriendDetailsViewController else {
            return nil
        }
        
        let view = controller
        
        let presenter = FriendDetailsPresenter()
        let interactor = FriendDetailsInteractor(friend: friend)
        let router = FriendDetailsRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.controller = controller
        
        return controller
    }
    
    func dismissModule() {
        controller?.navigationController?.popViewController(animated: true)
    }
    
}
