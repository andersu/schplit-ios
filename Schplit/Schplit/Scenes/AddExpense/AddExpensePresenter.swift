//
//  AddExpensePresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 06/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol AddExpensePresenterOutput: class {
    func updateViews(viewModel: AddExpenseViewModel)
}

class AddExpensePresenter {
    
    weak var output: AddExpensePresenterOutput!
    var viewModel: AddExpenseViewModel
    
    init(viewModel: AddExpenseViewModel) {
        self.viewModel = viewModel
    }
    
}

extension AddExpensePresenter: AddExpenseInteractorOutput {
    func viewDidLoad(group: SchplitGroup) {
        viewModel.group = group
        
        DispatchQueue.main.async {
            self.output.updateViews(viewModel: self.viewModel)
        }
    }

}
