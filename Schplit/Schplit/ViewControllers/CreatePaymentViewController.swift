//
//  CreatePaymentViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol CreatePaymentViewControllerOutput {
    func viewDidLoad(bill: Bill)
}

class CreatePaymentViewController: UIViewController {
    @IBOutlet weak var createPaymentView: CreatePaymentView!
    
    var router: CreatePaymentRouterInput!
    var interactor: CreatePaymentViewControllerOutput!
    
    // Set by BillRouter when navigating here
    var bill: Bill!
    
    override func viewDidLoad() {
        createPaymentView.viewController = self
        CreatePaymentConfigurator.sharedInstance.configure(viewController: self)
        interactor.viewDidLoad(bill: bill)
    }
}

extension CreatePaymentViewController: CreatePaymentViewDelegate {
    
}

extension CreatePaymentViewController: CreatePaymentPresenterOutput {
    func updateViews(viewModel: CreatePaymentViewModel) {
        createPaymentView.updateViews(viewModel: viewModel)
    }
}
