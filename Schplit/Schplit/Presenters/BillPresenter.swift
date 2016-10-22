//
//  BillPresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol BillPresenterOutput {
    func updateViews(viewModel: BillViewModel)
}

class BillPresenter {
    var viewController: BillPresenterOutput!
    var viewModel: BillViewModel
    
    init(viewModel: BillViewModel) {
        self.viewModel = viewModel
    }
}

extension BillPresenter: BillInteractorOutput {
    func viewDidLoad(bill: Bill) {
        viewModel.bill = bill
        
        DispatchQueue.main.async {
            self.viewController.updateViews(viewModel: self.viewModel)
        }
    }
}
