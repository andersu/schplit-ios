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
    
    var viewController: CreateBillViewDelegate!
    
    @IBAction func addSchplitterButtonClicked(_ sender: UIButton) {
        viewController.addSchplitterButtonClicked(name: nameTextField.text)
    }
    
    @IBAction func createBillButtonClicked(_ sender: UIButton) {
        viewController.createBillButtonClicked()
    }
    
    func updateViews(viewModel: CreateBillViewModel) {
        
    }
}
