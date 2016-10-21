//
//  CreateBillPresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol CreateBillPresenterOutput {
    func updateViews(viewModel: CreateBillViewModel)
}

class CreateBillPresenter {
    var viewController: CreateBillPresenterOutput!
    var viewModel: CreateBillViewModel
    
    init(viewModel: CreateBillViewModel) {
        self.viewModel = viewModel
    }
}

extension CreateBillPresenter: CreateBillInteractorOutput {
    func addSchplitterButtonClicked(name: String?) {
        if name != nil {
            viewModel.names.append(name!)
            viewController.updateViews(viewModel: viewModel)
        }
    }
}
