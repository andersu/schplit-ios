//
//  CreateGroupInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol CreateGroupInteractorOutput {
    func titleTextFieldDidEndEditing(text: String?)
    func nameTextFieldDidEndEditing(text: String?)
    func addSchplitterButtonClicked(name: String?)
    
    func groupSaved()
}

class CreateGroupInteractor {
    
    var output: CreateGroupInteractorOutput!
    var groupService: GroupService
    
    init(groupService: GroupService) {
        self.groupService = groupService
    }
}

extension CreateGroupInteractor: CreateGroupViewControllerOutput {
    func titleTextFieldDidEndEditing(text: String?) {
        output.titleTextFieldDidEndEditing(text: text)
    }
    
    func nameTextFieldDidEndEditing(text: String?) {
        output.nameTextFieldDidEndEditing(text: text)
    }
    
    func addSchplitterButtonClicked(name: String?) {
        output.addSchplitterButtonClicked(name: name)
    }
    
    func createGroupButtonClicked(group: SchplitGroup) {
        groupService.saveGroup(group: group)
        
        output.groupSaved()
    }

}

extension CreateGroupInteractor: CreateGroupRouterDataSource {
    
}

extension CreateGroupInteractor: CreateGroupRouterDataDestination {
    
}
