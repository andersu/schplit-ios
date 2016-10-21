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
    
    // MARK: addSchplitterButtonClicked
    func testAddSchplitterButtonClicked_callsViewControllerUpdateViews_withViewModel_withNameLastInNames() {
        let name = "name"
        
        createBillPresenter.addSchplitterButtonClicked(name: name)
        
        XCTAssertTrue(mockCreateBillViewController.viewModelFromUpdateViews!.names.last == name)
    }
    
    // MARK: Mocks
    class MockCreateBillViewController: CreateBillPresenterOutput {
        private (set) var viewModelFromUpdateViews: CreateBillViewModel?
        
        func updateViews(viewModel: CreateBillViewModel) {
            viewModelFromUpdateViews = viewModel
        }
    }
}
