//
//  FrontPageInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol FrontPageInteractorOutput {
    func presentBills(bills: [Bill])
}

class FrontPageInteractor {
    var presenter: FrontPagePresenter!
    var billService: BillService
    
    init(billService: BillService) {
        self.billService = billService
    }
}

extension FrontPageInteractor: FrontPageViewControllerOutput {
    func viewWillAppear() {
        let bills = billService.getBills()
        presenter.presentBills(bills: bills)
    }
}
