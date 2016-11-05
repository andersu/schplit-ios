//
//  AddExpenseViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 06/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol AddExpenseViewControllerOutput {
    func viewDidLoad(group: SchplitGroup)
}

class AddExpenseViewController: UIViewController {
    @IBOutlet weak var addExpenseView: AddExpenseView!
    
    var output: AddExpenseViewControllerOutput!
    var router: AddExpenseRouter!
    
    // Set by GroupRouter when navigating here
    var group: SchplitGroup!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AddExpenseConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addExpenseView.viewController = self
        output.viewDidLoad(group: group)
    }
}

extension AddExpenseViewController: AddExpenseViewDelegate {
    
}

extension AddExpenseViewController: AddExpensePresenterOutput {
    func updateViews(viewModel: AddExpenseViewModel) {
        addExpenseView.updateViews(viewModel: viewModel)
    }
}
