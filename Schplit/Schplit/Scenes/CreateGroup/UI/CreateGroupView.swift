//
//  CreateGroupView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol CreateGroupViewDelegate {
    func titleTextFieldDidEndEditing(text: String?)
    func nameTextFieldDidEndEditing(text: String?)
    
    func addSchplitterButtonClicked(name: String?)
    func createGroupButtonClicked(group: SchplitGroup)
}

class CreateGroupView: NibLoadingView {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var schplitterTableView: UITableView!
    
    let schplitterCellIdentifier = "SchplitterCell"
    
    var viewController: CreateGroupViewDelegate!
    var viewModel = CreateGroupViewModel()
    
    override func awakeFromNib() {
        initSchplitterTableView()
    }
    
    @IBAction func addSchplitterButtonClicked(_ sender: UIButton) {
        viewController.addSchplitterButtonClicked(name: nameTextField.text)
    }
    
    @IBAction func createGroupButtonClicked(_ sender: UIButton) {
        if let title = viewModel.titleText {
            let group = SchplitGroup(title: title, names: viewModel.names)
            viewController.createGroupButtonClicked(group: group)
        }
    }
    
    func updateViews(viewModel: CreateGroupViewModel) {
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

extension CreateGroupView: UITableViewDataSource {
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

extension CreateGroupView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == titleTextField {
            viewController.titleTextFieldDidEndEditing(text: textField.text)
        }
        
        if textField == nameTextField {
            viewController.nameTextFieldDidEndEditing(text: textField.text)
        }
    }
}
