//
//  CreateBillInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol CreateBillInteractorOutput {
    func titleTextFieldDidEndEditing(text: String?)
    func nameTextFieldDidEndEditing(text: String?)
    func addSchplitterButtonClicked(name: String?)
}

class CreateBillInteractor {
    var presenter: CreateBillInteractorOutput!
}

extension CreateBillInteractor: CreateBillViewControllerOutput {
    func titleTextFieldDidEndEditing(text: String?) {
        presenter.titleTextFieldDidEndEditing(text: text)
    }
    
    func nameTextFieldDidEndEditing(text: String?) {
        presenter.nameTextFieldDidEndEditing(text: text)
    }

    func addSchplitterButtonClicked(name: String?) {
        presenter.addSchplitterButtonClicked(name: name)
    }
}
