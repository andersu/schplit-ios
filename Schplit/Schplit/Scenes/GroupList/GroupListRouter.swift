//
//  GroupListRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupListRouterInput {
    func navigateToCreateGroupScene()
    func navigateToGroupScene(group: SchplitGroup)
}

protocol GroupListRouterDataSource: class {
     var selectedGroup: SchplitGroup! { get }
}

protocol GroupListRouterDataDestination: class {
    
}

class GroupListRouter: GroupListRouterInput {
    
    weak var viewController: GroupListViewController!
    weak private var dataSource: GroupListRouterDataSource!
    weak var dataDestination: GroupListRouterDataDestination!
    
    struct SegueIdentifiers {
        static let createGroup = "ShowCreateGroupScene"
        static let group = "ShowGroupScene"
    }

    init(viewController: GroupListViewController,
         dataSource: GroupListRouterDataSource,
         dataDestination: GroupListRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    func navigateToCreateGroupScene() {
        viewController.performSegue(withIdentifier: SegueIdentifiers.createGroup, sender: viewController)
    }
    
    func navigateToGroupScene(group: SchplitGroup) {
        let groupViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "GroupViewController") as! GroupViewController
        groupViewController.group = group
        
        viewController.navigationController?.pushViewController(groupViewController, animated: true)
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        switch segueIdentifier {
        case SegueIdentifiers.group:
            passDataToGroupScene(segue: segue)
        default:
            return
        }
    }
    
    func passDataToGroupScene(segue:UIStoryboardSegue) {
        if let groupViewController = segue.destination as? GroupViewController {
            groupViewController.router.dataDestination.group = dataSource.selectedGroup
        }
    }
}
