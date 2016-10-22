//
//  BillConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class BillConfigurator {
    static let sharedInstance = BillConfigurator()
    
    private init() {
        // Enforce Singleton Pattern
    }
    
    func configure(viewController: BillViewController) {
        let viewModel = BillViewModel()
        let presenter = BillPresenter(viewModel: viewModel)
        presenter.viewController = viewController
        
        /*let client = HTTPClient()
         let chatService = BillService(client: client)*/
        
        let billRepository = BillRepository()
        let billService = BillService(billRepository: billRepository)
        let interactor = BillInteractor()
        interactor.presenter = presenter
        
        viewController.interactor = interactor
        
        let router = BillRouter()
        router.viewController = viewController
        viewController.router = router
    }
}
