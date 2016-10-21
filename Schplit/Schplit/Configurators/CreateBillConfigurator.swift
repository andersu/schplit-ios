//
//  CreateBillConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class CreateBillConfigurator {
    static let sharedInstance = CreateBillConfigurator()
    
    private init() {
        // Enforce Singleton Pattern
    }
    
    func configure(viewController: CreateBillViewController){
        let viewModel = CreateBillViewModel()
        let presenter = CreateBillPresenter(viewModel: viewModel)
        presenter.viewController = viewController
     
        /*let client = HTTPClient()
        let chatService = BillService(client: client)*/
        
        let billRepository = BillRepository()
        let billService = BillService(billRepository: billRepository)
        let interactor = CreateBillInteractor(billService: billService)
        interactor.presenter = presenter
         
        viewController.interactor = interactor
        
        /*let router = FrontPageRouter()
        router.viewController = viewController
        viewController.router = router*/
    }
    

}
