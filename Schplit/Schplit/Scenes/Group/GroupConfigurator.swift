//
//  GroupConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

struct GroupConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = GroupConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: GroupViewController) {
        let viewModel = GroupViewModel()
        let presenter = GroupPresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let interactor = GroupInteractor()
        interactor.output = presenter
        
        let router = GroupRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
