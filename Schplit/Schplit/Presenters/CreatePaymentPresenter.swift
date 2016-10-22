//
//  CreatePaymentPresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol CreatePaymentPresenterOutput {
    func updateViews(viewModel: CreatePaymentViewModel)
}

class CreatePaymentPresenter {
    var viewController: CreatePaymentPresenterOutput!
    var viewModel: CreatePaymentViewModel
    
    init(viewModel: CreatePaymentViewModel) {
        self.viewModel = viewModel
    }
}

extension CreatePaymentPresenter: CreatePaymentInteractorOutput {
    func viewDidLoad(bill: Bill) {
        viewModel.bill = bill
        
        DispatchQueue.main.async {
            self.viewController.updateViews(viewModel: self.viewModel)
        }
    }
}
