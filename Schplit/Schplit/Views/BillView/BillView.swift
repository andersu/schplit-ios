//
//  BillView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol BillViewDelegate {
    func newPaymentButtonClicked()
}

class BillView: NibLoadingView {
    @IBOutlet weak var tableView: UITableView!
    
    var viewController: BillViewDelegate!
    
    func updateViews(viewModel: BillViewModel) {
        
    }
    
    @IBAction func newPaymentButtonClicked(_ sender: UIButton) {
        viewController.newPaymentButtonClicked()
    }
}
