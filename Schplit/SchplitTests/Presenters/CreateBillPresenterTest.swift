//
//  CreateBillPresenterTest.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest

@testable import Schplit

class CreateBillPresenterTest: XCTestCase {
    var createBillPresenter = CreateBillPresenter(viewModel: CreateBillViewModel())
    var mockCreateBillViewController = MockCreateBillViewController()
    
    override func setUp() {
        createBillPresenter.viewController = mockCreateBillViewController
    }
    
    // MARK: titleTextFieldDidEndEditing
    func testTitleTextFieldDidEndEditing_callsViewControllerUpdateViews_withViewModel_withTextAsTitleText() {
        let text = "text"
        let expectation1 = expectation(description: "assertsPassed")
        
        createBillPresenter.titleTextFieldDidEndEditing(text: text)
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return text == self.mockCreateBillViewController.viewModelFromUpdateViews!.titleText
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    // MARK: nameTextFieldDidEndEditing
    func testNameTitleTextFieldDidEndEditing_callsViewControllerUpdateViews_withViewModel_withTextAsNameText() {
        let text = "text"
        let expectation1 = expectation(description: "assertsPassed")
        
        createBillPresenter.nameTextFieldDidEndEditing(text: text)
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return text == self.mockCreateBillViewController.viewModelFromUpdateViews!.nameText
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    // MARK: addSchplitterButtonClicked
    func testAddSchplitterButtonClicked_callsViewControllerUpdateViews_withViewModel_withNameLastInNames() {
        let name = "name"
        let expectation1 = expectation(description: "assertsPassed")
        
        createBillPresenter.addSchplitterButtonClicked(name: name)
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return self.mockCreateBillViewController.viewModelFromUpdateViews!.names.last == name
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    // MARK: Mocks
    class MockCreateBillViewController: CreateBillPresenterOutput {
        private (set) var viewModelFromUpdateViews: CreateBillViewModel?
        
        func updateViews(viewModel: CreateBillViewModel) {
            viewModelFromUpdateViews = viewModel
        }
    }
}
