//
//  GroupRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupRouterInput {
    func navigateToAddExpense()
}

protocol GroupRouterDataSource: class {
    var group: SchplitGroup! { get }
}

protocol GroupRouterDataDestination: class {
    var group: SchplitGroup! {get set}
}

class GroupRouter: GroupRouterInput {
    
    weak var viewController: GroupViewController!
    weak private var dataSource: GroupRouterDataSource!
    weak var dataDestination: GroupRouterDataDestination!
    
    struct SegueIdentifiers {
        static let addExpense = "ShowAddExpenseScene"
    }
    
    init(viewController: GroupViewController,
         dataSource: GroupRouterDataSource,
         dataDestination: GroupRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        switch segueIdentifier {
        case SegueIdentifiers.addExpense:
            passDataToAddExpenseScene(segue: segue)
        default:
            return
        }
    }
    
    private func passDataToAddExpenseScene(segue: UIStoryboardSegue) {
        if let addExpenseViewController = segue.destination as? AddExpenseViewController {
            addExpenseViewController.router.dataDestination.group = dataSource.group
        }
    }
    
    func navigateToAddExpense() {
        viewController.performSegue(withIdentifier: SegueIdentifiers.addExpense, sender: viewController)
    }
}
