//
//  FrontPageView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol FrontPageViewDelegate {
    func newBillButtonClicked()
}

class FrontPageView: NibLoadingView {
    @IBOutlet weak var billTableView: UITableView!
    
    var viewController: FrontPageViewDelegate!
    var viewModel = FrontPageViewModel()
    
    let billCellIdentifier = "BillCell"
    
    override func awakeFromNib() {
        initTableView()
    }
    
    @IBAction func newBillButtonClicked(_ sender: UIButton) {
        viewController.newBillButtonClicked()
    }
    
    func updateViews(viewModel: FrontPageViewModel) {
        self.viewModel = viewModel
        
        billTableView.reloadData()
    }
    
    private func initTableView() {
        billTableView.register(BillCell.self, forCellReuseIdentifier: billCellIdentifier)
        
        billTableView.estimatedRowHeight = 50
        billTableView.rowHeight = UITableViewAutomaticDimension
        
        // Remove separators below bottom cell
        billTableView.tableFooterView = UIView()
    }
}

extension FrontPageView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: billCellIdentifier) as! BillCell
        
        cell.populate(bill: viewModel.bills[indexPath.row])
        
        return cell
    }
}
