//
//  AddExpenseConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 06/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

struct AddExpenseConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = AddExpenseConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: AddExpenseViewController) {
        let viewModel = AddExpenseViewModel()
        let presenter = AddExpensePresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let interactor = AddExpenseInteractor()
        interactor.output = presenter
        
        let router = AddExpenseRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
