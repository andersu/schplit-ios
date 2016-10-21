//
//  FrontPageConfigurator.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

class FrontPageConfigurator {
    static let sharedInstance = FrontPageConfigurator()
    
    private init() {
        // Enforce Singleton Pattern
    }
    
    func configure(viewController: FrontPageViewController){
        let viewModel = FrontPageViewModel()
        let presenter = FrontPagePresenter(viewModel: viewModel)
        presenter.viewController = viewController
        /*
        let client = HTTPClient()
        let chatService = ChatService(client: client)
        let dialogService = DialogService()
        let messageService = MessageService()
        let keychainService = KeychainService()*/
        
        let billRepository = BillRepository()
        let billService = BillService(billRepository: billRepository)
        let interactor = FrontPageInteractor(billService: billService)
        interactor.presenter = presenter
        
        viewController.interactor = interactor
        
        let router = FrontPageRouter()
        router.viewController = viewController
        viewController.router = router
    }
}
