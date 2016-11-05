//
//  CreateGroupRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol CreateGroupRouterInput {
    func navigateToFrontPage()
}

protocol CreateGroupRouterDataSource: class {
    
}

protocol CreateGroupRouterDataDestination: class {
    
}

class CreateGroupRouter: CreateGroupRouterInput {
    
    weak var viewController: CreateGroupViewController!
    weak private var dataSource: CreateGroupRouterDataSource!
    weak var dataDestination: CreateGroupRouterDataDestination!
    
    init(viewController: CreateGroupViewController,
         dataSource: CreateGroupRouterDataSource,
         dataDestination: CreateGroupRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
    
    func navigateToFrontPage() {
        let _ = viewController.navigationController?.popViewController(animated: false)
    }
}
