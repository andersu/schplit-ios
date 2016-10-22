//
//  BillViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol BillViewControllerOutput {
    func viewDidLoad(bill: Bill)
}

class BillViewController: UIViewController {
    
    @IBOutlet weak var billView: BillView!
    
    // Set by FrontPageRouter when navigating here
    var bill: Bill!
    
    var router: BillRouter!
    var interactor: BillViewControllerOutput!
    
    override func viewDidLoad() {
        billView.viewController = self
        BillConfigurator.sharedInstance.configure(viewController: self)
        interactor.viewDidLoad(bill: bill)
    }
}

extension BillViewController: BillViewDelegate {
    func newPaymentButtonClicked() {
        router.navigateToCreatePayment(bill: bill)
    }
}

extension BillViewController: BillPresenterOutput {
    func updateViews(viewModel: BillViewModel) {
        navigationItem.title = viewModel.bill?.title
        
        billView.updateViews(viewModel: viewModel)
    }
}
