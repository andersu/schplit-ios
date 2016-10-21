//
//  CreateBillInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol CreateBillInteractorOutput {
    func addSchplitterButtonClicked(name: String?)
}

class CreateBillInteractor {
    var presenter: CreateBillInteractorOutput!
}

extension CreateBillInteractor: CreateBillViewControllerOutput {
    func addSchplitterButtonClicked(name: String?) {
        presenter.addSchplitterButtonClicked(name: name)
    }
}
