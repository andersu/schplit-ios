//
//  GroupInteractor.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupInteractorOutput {
    func viewDidLoad(group: SchplitGroup)
}

class GroupInteractor {
    
    var output: GroupInteractorOutput!
    
    internal var group: SchplitGroup!
    
    // MARK: Business logic
    

}

extension GroupInteractor: GroupViewControllerOutput {
    func viewDidLoad(group: SchplitGroup) {
        output.viewDidLoad(group: group)
    }
}

extension GroupInteractor: GroupRouterDataSource {
    
}

extension GroupInteractor: GroupRouterDataDestination {
}
