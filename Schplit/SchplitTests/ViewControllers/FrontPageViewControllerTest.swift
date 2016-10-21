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
    
    override func setUp() {
        frontPageViewController.router = mockFrontPageRouter
    }
    
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
}
