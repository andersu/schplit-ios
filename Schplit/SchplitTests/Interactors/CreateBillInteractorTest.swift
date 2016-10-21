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
    var createBillInteractor: CreateBillInteractor!
    
    var mockBillService = MockBillService(billRepository: BillRepository())
    var mockCreateBillPresenter = MockCreateBillPresenter()
    
    override func setUp() {
        createBillInteractor = CreateBillInteractor(billService: mockBillService)
        createBillInteractor.presenter = mockCreateBillPresenter
    }
    
    // MARK: titleTextFieldDidEndEditing
    func testTitleTextFieldDidEndEditing_callsPresenter_withText() {
        let text = "text"
        createBillInteractor.titleTextFieldDidEndEditing(text: text)
        
        XCTAssertEqual(text, mockCreateBillPresenter.textFromTitleTextField)
    }
    
    // MARK: nameTextFieldDidEndEditing
    func testNameTextFieldDidEndEditing_callsPresenter_withText() {
        let text = "text"
        createBillInteractor.nameTextFieldDidEndEditing(text: text)
        
        XCTAssertEqual(text, mockCreateBillPresenter.textFromNameTextField)
    }
    
    // MARK addSchplitterButtonClicked
    func testAddSchplitterButtonClicked_callsPresenter_withName() {
        let name = "name"
        createBillInteractor.addSchplitterButtonClicked(name: name)
        
        XCTAssertEqual(name, mockCreateBillPresenter.nameFromAddSchplitterButtonClicked)
    }
    
    // MARK: Mocks
    class MockCreateBillPresenter: CreateBillInteractorOutput {
        private (set) var textFromTitleTextField: String?
        private (set) var textFromNameTextField: String?
        private (set) var nameFromAddSchplitterButtonClicked: String?
        
        func titleTextFieldDidEndEditing(text: String?) {
            textFromTitleTextField = text
        }
        
        func nameTextFieldDidEndEditing(text: String?) {
            textFromNameTextField = text
        }
        
        func addSchplitterButtonClicked(name: String?) {
            nameFromAddSchplitterButtonClicked = name
        }
        
        func billSaved() {
            
        }
    }
    
    class MockBillService: BillService {
        
    }
}
