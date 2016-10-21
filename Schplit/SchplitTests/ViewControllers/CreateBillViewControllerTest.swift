//
//  CreateBillViewControllerTest.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest

@testable import Schplit

class CreateBillViewControllerTest: XCTestCase {
    var createBillViewController = CreateBillViewController()
    var mockCreateBillInteractor = MockCreateBillInteractor()
    
    override func setUp() {
        createBillViewController.interactor = mockCreateBillInteractor
    }
    
    // MARK: addSchplitterButtonClicked
    func testAddSchplitterButtonClicked_callsInteractor_withName() {
        let name = "name"
        
        createBillViewController.addSchplitterButtonClicked(name: name)
        
        XCTAssertEqual(name, mockCreateBillInteractor.nameFromAddSchplitterButtonClicked)
    }
    
    // MARK: Mocks
    class MockCreateBillInteractor: CreateBillViewControllerOutput {
        private (set) var nameFromAddSchplitterButtonClicked: String?
        
        func addSchplitterButtonClicked(name: String?) {
            nameFromAddSchplitterButtonClicked = name
        }
    }
}
