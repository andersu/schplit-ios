//
//  CreatePaymentConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class CreatePaymentConfigurator {
    static let sharedInstance = CreatePaymentConfigurator()
    
    private init() {
        // Enforce Singleton Pattern
    }
    
    func configure(viewController: CreatePaymentViewController) {
        let viewModel = CreatePaymentViewModel()
        let presenter = CreatePaymentPresenter(viewModel: viewModel)
        presenter.viewController = viewController
        
        /*let client = HTTPClient()
         let chatService = BillService(client: client)*/
        
        let interactor = CreatePaymentInteractor()
        interactor.presenter = presenter
        
        viewController.interactor = interactor
        
        let router = CreatePaymentRouter()
        router.viewController = viewController
        viewController.router = router
    }
}
