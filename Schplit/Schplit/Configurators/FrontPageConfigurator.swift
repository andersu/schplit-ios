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
        /*let viewModel = ChatViewModel()
        let presenter = ChatPresenter(viewModel: viewModel)
        presenter.viewController = viewController
        
        let client = HTTPClient()
        let chatService = ChatService(client: client)
        let dialogService = DialogService()
        let messageService = MessageService()
        let keychainService = KeychainService()
        
        let interactor = ChatInteractor(chatService: chatService, dialogService: dialogService, messageService: messageService, keychainService: keychainService)
        interactor.presenter = presenter
        
        viewController.interactor = interactor*/
        
        let router = FrontPageRouter()
        router.viewController = viewController
        viewController.router = router
    }

    
    
}
