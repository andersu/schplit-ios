//
//  GroupService.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class GroupService {
    var groupRepository: GroupRepository
    
    init(groupRepository: GroupRepository) {
        self.groupRepository = groupRepository
    }
    
    func saveGroup(group: SchplitGroup) {
        groupRepository.insert(group: group)
    }
    
    func getGroups() -> [SchplitGroup] {
        return groupRepository.getGroups()
    }
}
