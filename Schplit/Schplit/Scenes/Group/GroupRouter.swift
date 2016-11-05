//
//  GroupRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupRouterInput {
       func navigateToCreatePayment(group: SchplitGroup)
}

protocol GroupRouterDataSource: class {
    
}

protocol GroupRouterDataDestination: class {
    var group: SchplitGroup! {get set}
}

class GroupRouter: GroupRouterInput {
    
    weak var viewController: GroupViewController!
    weak private var dataSource: GroupRouterDataSource!
    weak var dataDestination: GroupRouterDataDestination!
    
    init(viewController: GroupViewController,
         dataSource: GroupRouterDataSource,
         dataDestination: GroupRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
    
    func navigateToCreatePayment(group: SchplitGroup) {
        let createGroupViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "AddExpenseViewController") as! AddExpenseViewController
        
        createGroupViewController.group = group
        
        viewController.navigationController?.pushViewController(createGroupViewController, animated: false)
    }
}
