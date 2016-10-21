//
//  BillService.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class BillService {
    var billRepository: BillRepository
    
    init(billRepository: BillRepository) {
        self.billRepository = billRepository
    }
    
    func saveBill(bill: Bill) {
        billRepository.insert(bill: bill)
    }
}
