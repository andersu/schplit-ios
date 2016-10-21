//
//  CreateBillRouter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol CreateBillRouterInput {
    func navigateToFrontPage()
}

class CreateBillRouter: CreateBillRouterInput {
    var viewController: CreateBillViewController!
    
    func navigateToFrontPage() {
        let _ = viewController.navigationController?.popViewController(animated: false)
    }
}
