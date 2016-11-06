//
//  AddExpenseInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 06/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol AddExpenseInteractorOutput {
    func viewDidLoad(group: SchplitGroup)
}

class AddExpenseInteractor {
    
    var output: AddExpenseInteractorOutput!
    
    internal var group: SchplitGroup!
}

extension AddExpenseInteractor: AddExpenseViewControllerOutput {
    func viewDidLoad() {
        output.viewDidLoad(group: group)
    }
}

extension AddExpenseInteractor: AddExpenseRouterDataSource {
    
}

extension AddExpenseInteractor: AddExpenseRouterDataDestination {
    
}
