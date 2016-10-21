//
//  FrontPagePresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol FrontPagePresenterOutput {
    func updateViews(viewModel: FrontPageViewModel)
}

class FrontPagePresenter {
    var viewController: FrontPagePresenterOutput!
    var viewModel: FrontPageViewModel
    
    init(viewModel: FrontPageViewModel) {
        self.viewModel = viewModel
    }
}

extension FrontPagePresenter: FrontPageInteractorOutput {
    func presentBills(bills: [Bill]) {
        viewModel.bills = bills
        
        DispatchQueue.main.async {
            self.viewController.updateViews(viewModel: self.viewModel)
        }
    }
}
