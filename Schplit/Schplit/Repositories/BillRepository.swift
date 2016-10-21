//
//  BillRepository.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import RealmSwift

class BillRepository {
    
    func insert(bill: Bill) {
        let realmBill = RealmBill.fromBill(bill: bill)
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(realmBill)
        }
    }
    
    func getBills() -> [Bill] {
        let realm = try! Realm()
        let realmBills = realm.objects(RealmBill.self)
        
        var bills: [Bill] = []
        for realmBill in realmBills {
            let bill = realmBill.toBill()
            bills.append(bill)
        }
        
        return bills
    }
}
