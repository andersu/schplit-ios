//
//  CreateBillInteractorTest.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest

@testable import Schplit

class CreateBillInteractorTest: XCTestCase {
    var createBillInteractor = CreateBillInteractor()
    var mockCreateBillPresenter = MockCreateBillPresenter()
    
    override func setUp() {
        createBillInteractor.presenter = mockCreateBillPresenter
    }
    
    // MARK addSchplitterButtonClicked
    func testAddSchplitterButtonClicked_callsPresenter_withName() {
        let name = "name"
        createBillInteractor.addSchplitterButtonClicked(name: name)
        
        XCTAssertEqual(name, mockCreateBillPresenter.nameFromAddSchplitterButtonClicked)
    }
    
    // MARK: Mocks
    class MockCreateBillPresenter: CreateBillInteractorOutput {
        private (set) var nameFromAddSchplitterButtonClicked: String?
        
        func addSchplitterButtonClicked(name: String?) {
            nameFromAddSchplitterButtonClicked = name
        }
    }
}
