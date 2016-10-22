//
//  CreatePaymentView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol CreatePaymentViewDelegate {
    
}

class CreatePaymentView: NibLoadingView {
    @IBOutlet weak var paymentSchplitterTableView: UITableView!
    
    var viewController: CreatePaymentViewDelegate!
    var viewModel = CreatePaymentViewModel()
    
    let paymentSchplitterCellIdentifier = "PaymentSchplitterCell"
    
    override func awakeFromNib() {
        initTableView()
    }
    
    func updateViews(viewModel: CreatePaymentViewModel) {
        self.viewModel = viewModel
        paymentSchplitterTableView.reloadData()
    }
    
    private func initTableView() {
        paymentSchplitterTableView.register(PaymentSchplitterCell.self, forCellReuseIdentifier: paymentSchplitterCellIdentifier)
        
        paymentSchplitterTableView.estimatedRowHeight = 50
        paymentSchplitterTableView.rowHeight = UITableViewAutomaticDimension
        
        // Remove separators below bottom cell
        paymentSchplitterTableView.tableFooterView = UIView()
    }
    
    @IBAction func createPaymentButtonClicked(_ sender: UIButton) {
        
    }
}

extension CreatePaymentView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.bill == nil {
            return 0
        }
        
        return viewModel.bill!.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: paymentSchplitterCellIdentifier) as! PaymentSchplitterCell
        
        cell.populate(name: viewModel.bill!.names[indexPath.row])
        
        return cell
    }
}
