//
//  GroupListInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupListInteractorOutput {
    func presentGroups(groups: [SchplitGroup])
}

class GroupListInteractor {
    
    var output: GroupListInteractorOutput!
    var groupService: GroupService
    
    var selectedGroup: SchplitGroup!
    
    init(groupService: GroupService) {
        self.groupService = groupService
    }
}

extension GroupListInteractor: GroupListViewControllerOutput {
    func viewWillAppear() {
        let groups = groupService.getGroups()
        output.presentGroups(groups: groups)
    }
}

extension GroupListInteractor: GroupListRouterDataSource {
    
}

extension GroupListInteractor: GroupListRouterDataDestination {
    
}
