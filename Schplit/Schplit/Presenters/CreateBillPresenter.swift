//
//  CreateBillPresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol CreateBillPresenterOutput {
    func updateViews(viewModel: CreateBillViewModel)
}

class CreateBillPresenter {
    var viewController: CreateBillPresenterOutput!
    var viewModel: CreateBillViewModel
    
    init(viewModel: CreateBillViewModel) {
        self.viewModel = viewModel
    }
}

extension CreateBillPresenter: CreateBillInteractorOutput {
    func titleTextFieldDidEndEditing(text: String?) {
        viewModel.titleText = text
        
        updateViewsOnMainThread()
    }
    
    func nameTextFieldDidEndEditing(text: String?) {
        viewModel.nameText = text
        
        updateViewsOnMainThread()
    }
    
    func addSchplitterButtonClicked(name: String?) {
        if name != nil && !name!.isEmpty {
            viewModel.names.append(name!)
            viewModel.nameText = nil
            
            updateViewsOnMainThread()
        }
    }
    
    func billSaved() {
        
    }
    
    private func updateViewsOnMainThread() {
        DispatchQueue.main.async {
            self.viewController.updateViews(viewModel: self.viewModel)
        }
    }
}
