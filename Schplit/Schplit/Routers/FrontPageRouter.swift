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
}

class FrontPageRouter: FrontPageRouterInput {
    var viewController: FrontPageViewController!
    
    func navigateToCreateBill() {
        let createBillViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "CreateBillViewController") as! CreateBillViewController
        viewController.navigationController?.pushViewController(createBillViewController, animated: false)
    }
}
