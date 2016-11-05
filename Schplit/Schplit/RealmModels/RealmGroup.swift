//
//  RealmGroup.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import RealmSwift

class RealmGroup: Object {
    dynamic var title = ""
    dynamic var names: String = ""
    
    class func fromGroup(group: SchplitGroup) -> RealmGroup {
        let realmGroup = RealmGroup()
        realmGroup.title = group.title
        realmGroup.names = group.names.joined(separator: ",")
        
        return realmGroup
    }
    
    func toSchplitGroup() -> SchplitGroup {
        return SchplitGroup(title: title, names: names.components(separatedBy: ","))
    }
}
