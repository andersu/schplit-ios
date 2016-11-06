//
//  GroupView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol GroupViewDelegate {
    func newExpenseButtonClicked()
}

class GroupView: NibLoadingView {
    @IBOutlet weak var tableView: UITableView!
    
    var viewController: GroupViewDelegate!
    
    func updateViews(viewModel: GroupViewModel) {
        
    }
    
    @IBAction func newExpenseButtonClicked(_ sender: UIButton) {
        viewController.newExpenseButtonClicked()
    }
}
