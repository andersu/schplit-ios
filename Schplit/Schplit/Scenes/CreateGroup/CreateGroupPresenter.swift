//
//  CreateGroupPresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol CreateGroupPresenterOutput: class {
    func updateViews(viewModel: CreateGroupViewModel)
    func groupCreated(viewModel: CreateGroupViewModel)
}

class CreateGroupPresenter {
    
    weak var output: CreateGroupPresenterOutput!
    var viewModel: CreateGroupViewModel
    
    init(viewModel: CreateGroupViewModel) {
        self.viewModel = viewModel
    }
    
}

extension CreateGroupPresenter: CreateGroupInteractorOutput {
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
    
    func groupSaved() {
        // Reset viewModel
        viewModel = CreateGroupViewModel()
        output.groupCreated(viewModel: viewModel)
    }
    
    private func updateViewsOnMainThread() {
        DispatchQueue.main.async {
            self.output.updateViews(viewModel: self.viewModel)
        }
    }

}
