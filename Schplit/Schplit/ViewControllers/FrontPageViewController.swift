//
//  FrontPageViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

class FrontPageViewController: UIViewController {
    @IBOutlet weak var frontPageView: FrontPageView!
    
    var router: FrontPageRouterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FrontPageConfigurator.sharedInstance.configure(viewController: self)
        frontPageView.viewController = self
    }
}

extension FrontPageViewController: FrontPageViewDelegate {
    func newBillButtonClicked() {
        router.navigateToCreateBill()
    }
}
