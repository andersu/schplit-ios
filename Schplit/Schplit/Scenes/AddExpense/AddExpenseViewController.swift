//
//  AddExpenseViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 06/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol AddExpenseViewControllerOutput {
    func viewDidLoad()
}

class AddExpenseViewController: UIViewController {
    @IBOutlet weak var addExpenseView: AddExpenseView!
    
    var output: AddExpenseViewControllerOutput!
    var router: AddExpenseRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AddExpenseConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addExpenseView.viewController = self
        output.viewDidLoad()
    }
}

extension AddExpenseViewController: AddExpenseViewDelegate {
    
}

extension AddExpenseViewController: AddExpensePresenterOutput {
    func updateViews(viewModel: AddExpenseViewModel) {
        addExpenseView.updateViews(viewModel: viewModel)
    }
}
