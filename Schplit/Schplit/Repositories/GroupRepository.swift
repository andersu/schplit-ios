//
//  GroupRepository.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import RealmSwift

class GroupRepository {
    
    func insert(group: SchplitGroup) {
        let realmGroup = RealmGroup.fromGroup(group: group)
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(realmGroup)
        }
    }
    
    func getGroups() -> [SchplitGroup] {
        let realm = try! Realm()
        let realmGroups = realm.objects(RealmGroup.self)
        
        var groups: [SchplitGroup] = []
        for realmGroup in realmGroups {
            let group = realmGroup.toSchplitGroup()
            groups.append(group)
        }
        
        return groups
    }
}
