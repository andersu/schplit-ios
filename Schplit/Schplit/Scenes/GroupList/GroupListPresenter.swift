//
//  GroupListPresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupListPresenterOutput: class {
    func updateViews(viewModel: GroupListViewModel)
}

class GroupListPresenter {
    
    weak var output: GroupListPresenterOutput!
    var viewModel: GroupListViewModel
    
    init(viewModel: GroupListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Presentation logic
    
}

extension GroupListPresenter: GroupListInteractorOutput {
    func presentGroups(groups: [SchplitGroup]) {
        viewModel.groups = groups
        
        DispatchQueue.main.async {
            self.output.updateViews(viewModel: self.viewModel)
        }
    }
}
