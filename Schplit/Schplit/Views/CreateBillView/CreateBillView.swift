//
//  CreateBillView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol CreateBillViewDelegate {
    func addSchplitterButtonClicked(name: String?)
    func createBillButtonClicked()
}

class CreateBillView: NibLoadingView {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var schplitterTableView: UITableView!
    
    let schplitterCellIdentifier = "SchplitterCell"
    
    var viewController: CreateBillViewDelegate!
    var viewModel = CreateBillViewModel()
    
    override func awakeFromNib() {
        initSchplitterTableView()
    }
    
    @IBAction func addSchplitterButtonClicked(_ sender: UIButton) {
        viewController.addSchplitterButtonClicked(name: nameTextField.text)
    }
    
    @IBAction func createBillButtonClicked(_ sender: UIButton) {
        viewController.createBillButtonClicked()
    }
    
    func updateViews(viewModel: CreateBillViewModel) {
        self.viewModel = viewModel
        
        titleTextField.text = viewModel.titleText
        nameTextField.text = viewModel.nameText
        
        schplitterTableView.reloadData()
    }
    
    private func initSchplitterTableView() {
        schplitterTableView.register(SchplitterCell.self, forCellReuseIdentifier: schplitterCellIdentifier)
        
        schplitterTableView.estimatedRowHeight = 50
        schplitterTableView.rowHeight = UITableViewAutomaticDimension
        
        // Remove separators below bottom cell
        schplitterTableView.tableFooterView = UIView()
    }
}

extension CreateBillView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = schplitterTableView.dequeueReusableCell(withIdentifier: schplitterCellIdentifier) as! SchplitterCell
        cell.populate(name: viewModel.names[indexPath.row])
        
        return cell
    }
}
