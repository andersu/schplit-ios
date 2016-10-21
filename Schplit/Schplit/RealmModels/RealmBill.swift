//
//  RealmBill.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import RealmSwift

class RealmBill: Object {
    dynamic var title = ""
    dynamic var names: String = ""
    
    class func fromBill(bill: Bill) -> RealmBill {
        let realmBill = RealmBill()
        realmBill.title = bill.title
        realmBill.names = bill.names.joined(separator: ",")
        
        return realmBill
    }
    
    func toBill() -> Bill {
        return Bill(title: title, names: names.components(separatedBy: ","))
    }
}
