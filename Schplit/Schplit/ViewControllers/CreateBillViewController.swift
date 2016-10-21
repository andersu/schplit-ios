//
//  ViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol CreateBillViewControllerOutput: class {
    func addSchplitterButtonClicked(name: String?)
}

class CreateBillViewController: UIViewController {
    @IBOutlet weak var createBillView: CreateBillView!
    
    var interactor: CreateBillViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateBillConfigurator.sharedInstance.configure(viewController: self)
        createBillView.viewController = self
    }
}

extension CreateBillViewController: CreateBillViewDelegate {
    func addSchplitterButtonClicked(name: String?) {
        interactor.addSchplitterButtonClicked(name: name)
    }
    
    func createBillButtonClicked() {
        
    }
}

extension CreateBillViewController: CreateBillPresenterOutput {
    func updateViews(viewModel: CreateBillViewModel) {
        createBillView.updateViews(viewModel: viewModel)
    }
}

