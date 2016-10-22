//
//  BillRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol BillRouterInput {
    func navigateToCreatePayment(bill: Bill)
}

class BillRouter: BillRouterInput {
    var viewController: BillViewController!
    
    func navigateToCreatePayment(bill: Bill) {
        let createBillViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "CreatePaymentViewController") as! CreatePaymentViewController
        
        createBillViewController.bill = bill
        
        viewController.navigationController?.pushViewController(createBillViewController, animated: false)
    }
}
