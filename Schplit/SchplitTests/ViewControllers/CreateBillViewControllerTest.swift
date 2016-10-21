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
    
    // MARK: titleTextFieldDidEndEditing
    func testTitleTextFieldDidEndEditing_callsInteractor_withText() {
        let text = "text"
        createBillViewController.titleTextFieldDidEndEditing(text: text)
        
        XCTAssertEqual(text, mockCreateBillInteractor.textFromTitleTextField)
    }
    
    // MARK: nameTextFieldDidEndEditing
    func testNameTextFieldDidEndEditing_callsInteractor_withText() {
        let text = "text"
        createBillViewController.nameTextFieldDidEndEditing(text: text)
        
        XCTAssertEqual(text, mockCreateBillInteractor.textFromNameTextField)
    }
    
    
    // MARK: addSchplitterButtonClicked
    func testAddSchplitterButtonClicked_callsInteractor_withName() {
        let name = "name"
        
        createBillViewController.addSchplitterButtonClicked(name: name)
        
        XCTAssertEqual(name, mockCreateBillInteractor.nameFromAddSchplitterButtonClicked)
    }
    
    // MARK: Mocks
    class MockCreateBillInteractor: CreateBillViewControllerOutput {
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
    }
}
