//
//  FrontPageRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol FrontPageRouterInput {
    func navigateToCreateBill()
    func navigateTo(bill: Bill)
}

class FrontPageRouter: FrontPageRouterInput {
    var viewController: FrontPageViewController!
    
    func navigateToCreateBill() {
        let createBillViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "CreateBillViewController") as! CreateBillViewController
        viewController.navigationController?.pushViewController(createBillViewController, animated: false)
    }
    
    func navigateTo(bill: Bill) {
        let billViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "BillViewController") as! BillViewController
        billViewController.bill = bill
        viewController.navigationController?.pushViewController(billViewController, animated: false)
    }
}
