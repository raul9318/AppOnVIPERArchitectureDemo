//
//  FriendsListTests.swift
//  SimpleTestOfAppOnVIPERTests
//
//  Created by Рамиль Ибрагимов on 30.10.2017.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import XCTest
@testable import SimpleTestOfAppOnVIPER

class FriendsListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_createModule() {
        let navigationController = FriendsListRouter.createModule() as? UINavigationController
        XCTAssertNotNil(navigationController, "NavigationController is nil after create")
        let view = navigationController?.childViewControllers.first as? FriendsListViewInterface
        XCTAssertNotNil(view, "View is nil after create")
        XCTAssertTrue(view is FriendsListViewController, "View is not FriendsListViewController")
        
        let presenter = view?.presenter
        XCTAssertNotNil(presenter, "View is nil after create")
        XCTAssertTrue(presenter is FriendsListPresenter, "Presenter is not FriendsListPresenter")
        
        let interactor = presenter?.interactor
        XCTAssertNotNil(interactor, "Interactor is nil")
        XCTAssertTrue(interactor is FriendsListInteractor, "Interactor is not FriendsListInteractor")
        
        let router = presenter?.router
        XCTAssertNotNil(router, "Router is nil")
        XCTAssertTrue(router is FriendsListRouter, "Router is not FriendsListRouter")
        
        let presenterHasView = presenter?.view
        XCTAssertNotNil(presenterHasView, "Presenter's View is nil")
        XCTAssertTrue(presenterHasView === view, "Presenter's View is not the same as View")
        
        let interactorHasPresenter = interactor?.output as? FriendsListModuleInterface
        XCTAssertNotNil(interactorHasPresenter, "Interactor's output is nil")
        XCTAssertTrue(interactorHasPresenter is FriendsListInteractorOutput, "Interactor's output not is FriendsListInteractorOutput")
        XCTAssertTrue(interactorHasPresenter === presenter, "Interactor's output is not the same as Presenter")
        
        let routerHasController = router?.controller
        XCTAssertNotNil(routerHasController, "Router's controller is nil")
        XCTAssertTrue(routerHasController === view, "Router's controller is not the same as View")
    }
    
}
