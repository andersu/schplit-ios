//
//  AddExpenseRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 06/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol AddExpenseRouterInput {
    
}

protocol AddExpenseRouterDataSource: class {
    
}

protocol AddExpenseRouterDataDestination: class {
    
}

class AddExpenseRouter: AddExpenseRouterInput {
    
    weak var viewController: AddExpenseViewController!
    weak private var dataSource: AddExpenseRouterDataSource!
    weak var dataDestination: AddExpenseRouterDataDestination!
    
    init(viewController: AddExpenseViewController,
         dataSource: AddExpenseRouterDataSource,
         dataDestination: AddExpenseRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}
