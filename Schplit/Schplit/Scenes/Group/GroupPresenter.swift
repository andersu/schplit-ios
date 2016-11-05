//
//  GroupPresenter.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupPresenterOutput: class {
    func updateViews(viewModel: GroupViewModel)
}

class GroupPresenter {
    
    weak var output: GroupPresenterOutput!
    var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
}

extension GroupPresenter: GroupInteractorOutput {
    func viewDidLoad(group: SchplitGroup) {
        viewModel.group = group
        
        DispatchQueue.main.async {
            self.output.updateViews(viewModel: self.viewModel)
        }
    }
}
