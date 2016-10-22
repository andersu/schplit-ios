//
//  CreatePaymentInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol CreatePaymentInteractorOutput {
    func viewDidLoad(bill: Bill)
}

class CreatePaymentInteractor {
    var presenter: CreatePaymentInteractorOutput!
}

extension CreatePaymentInteractor: CreatePaymentViewControllerOutput {
    internal func viewDidLoad(bill: Bill) {
        presenter.viewDidLoad(bill: bill)
    }
}
