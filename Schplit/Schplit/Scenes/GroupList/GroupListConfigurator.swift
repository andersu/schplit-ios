//
//  GroupListConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

struct GroupListConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = GroupListConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: GroupListViewController) {
        let viewModel = GroupListViewModel()
        let presenter = GroupListPresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let groupRepository = GroupRepository()
        let groupService = GroupService(groupRepository: groupRepository)
        let interactor = GroupListInteractor(groupService: groupService)
        interactor.output = presenter
        
        let router = GroupListRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
