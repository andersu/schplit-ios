//
//  CreateGroupConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

struct CreateGroupConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = CreateGroupConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: CreateGroupViewController) {
        let viewModel = CreateGroupViewModel()
        let presenter = CreateGroupPresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let groupRepository = GroupRepository()
        let groupService = GroupService(groupRepository: groupRepository)
        let interactor = CreateGroupInteractor(groupService: groupService)
        interactor.output = presenter
        
        let router = CreateGroupRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
