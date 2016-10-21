//
//  FrontPageViewControllerTest.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest

@testable import Schplit

class FrontPageViewControllerTest: XCTestCase {
    
    var frontPageViewController = FrontPageViewController()
    var mockFrontPageRouter = MockFrontPageRouter()
    var mockFrontPageInteractor = MockFrontPageInteractor()
    var mockFrontPageView = MockFrontPageView()
    
    override func setUp() {
        frontPageViewController.router = mockFrontPageRouter
    }
    
    // MARK: viewDidLoad
    // TODO
    /*func testViewDidLoad_callsInteractor() {
        frontPageViewController.viewDidLoad()
        
        XCTAssertTrue(mockFrontPageInteractor.viewDidLoadCalled)
    }*/
    
    // MARK: newBillButtonClicked
    func testNewBillButtonClicked_callsRouter_navigateToCreateBill() {
        frontPageViewController.newBillButtonClicked()
        
        XCTAssertTrue(mockFrontPageRouter.navigateToCreateBillCalled)
    }
    
    // MARK: Mocks
    class MockFrontPageRouter: FrontPageRouterInput {
        private (set) var navigateToCreateBillCalled = false
        
        func navigateToCreateBill() {
            navigateToCreateBillCalled = true
        }
    }
    
    class MockFrontPageInteractor: FrontPageViewControllerOutput {
        private (set) var viewDidLoadCalled = false
        
        func viewDidLoad() {
            viewDidLoadCalled = true
        }
    }
    
    class MockFrontPageView: FrontPageView {
        var _viewController: FrontPageViewDelegate?
        override var viewController: FrontPageViewDelegate! {
            get {
                return self._viewController
            }
            set {
                self._viewController = viewController
            }
        }
    }
}
