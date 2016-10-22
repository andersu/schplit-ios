//
//  BillInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol BillInteractorOutput {
    func viewDidLoad(bill: Bill)
}

class BillInteractor {
    var presenter: BillInteractorOutput!
}

extension BillInteractor: BillViewControllerOutput {
    func viewDidLoad(bill: Bill) {
        presenter.viewDidLoad(bill: bill)
    }
}
