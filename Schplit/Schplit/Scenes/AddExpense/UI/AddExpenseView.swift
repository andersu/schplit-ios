//
//  AddExpenseView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol AddExpenseViewDelegate {
    
}

class AddExpenseView: NibLoadingView {
    var viewController: AddExpenseViewDelegate!
    var viewModel = AddExpenseViewModel()
    
    let paymentSchplitterCellIdentifier = "PaymentSchplitterCell"
    let whoPaidSuggestionCellIdentifier = "WhoPaidSuggestionCell"
    
    @IBOutlet weak var shadowView: UIView!
    fileprivate var newWhoPaidText = ""
    
    @IBOutlet weak var whoPaidTextField: UITextField!
    @IBOutlet weak var whoPaidSuggestionsTableView: UITableView!
    
    @IBOutlet weak var whoPaidSuggestionsTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var paymentSchplitterTableView: UITableView!
    
    override func awakeFromNib() {
        initTableViews()
    }
    
    func updateViews(viewModel: AddExpenseViewModel) {
        self.viewModel = viewModel
        paymentSchplitterTableView.reloadData()
    }
    
    private func initTableViews() {
        paymentSchplitterTableView.register(PaymentSchplitterCell.self, forCellReuseIdentifier: paymentSchplitterCellIdentifier)
        
        paymentSchplitterTableView.estimatedRowHeight = 50
        paymentSchplitterTableView.rowHeight = UITableViewAutomaticDimension
        
        // Remove separators below bottom cell
        paymentSchplitterTableView.tableFooterView = UIView()
        
        whoPaidSuggestionsTableView.register(WhoPaidSuggestionCell.self, forCellReuseIdentifier: whoPaidSuggestionCellIdentifier)
        
        whoPaidSuggestionsTableView.estimatedRowHeight = 37
        whoPaidSuggestionsTableView.rowHeight = UITableViewAutomaticDimension
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowRadius = 3
    }
    
    @IBAction func addExpenseButtonClicked(_ sender: UIButton) {
        
    }
}

extension AddExpenseView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == paymentSchplitterTableView {
            if viewModel.group == nil {
                return 0
            }
        
            return viewModel.group!.names.count
        }
        
        if tableView == whoPaidSuggestionsTableView {
            if let matchingNames = getSuggestions(startsWith: newWhoPaidText) {
                let newHeight = 37 * matchingNames.count
                whoPaidSuggestionsTableViewHeightConstraint.constant = CGFloat(newHeight)
                return matchingNames.count
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == paymentSchplitterTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: paymentSchplitterCellIdentifier) as! PaymentSchplitterCell
        
            cell.populate(name: viewModel.group!.names[indexPath.row])
        
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: whoPaidSuggestionCellIdentifier) as! WhoPaidSuggestionCell
        
        if let matchingNames = getSuggestions(startsWith: newWhoPaidText) {
            cell.populate(name: matchingNames[indexPath.row])
        }
        
        return cell
    }
    
    fileprivate func getSuggestions(startsWith string: String) -> [String]? {
        if string == "" {
            return []
        }
        
        return viewModel.group?.names.filter({ $0.hasPrefix(string) && $0 != string })
    }
}

extension AddExpenseView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == whoPaidSuggestionsTableView {
            if let suggestions = getSuggestions(startsWith: newWhoPaidText) {
                newWhoPaidText = suggestions[indexPath.row]
                whoPaidTextField.text = suggestions[indexPath.row]
                whoPaidSuggestionsTableView.reloadData()
            }
        }
    }
}

extension AddExpenseView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        newWhoPaidText = textField.text!
        newWhoPaidText = (newWhoPaidText as NSString).replacingCharacters(in: range, with: string)
        whoPaidSuggestionsTableView.reloadData()
        
        return true
    }
}
