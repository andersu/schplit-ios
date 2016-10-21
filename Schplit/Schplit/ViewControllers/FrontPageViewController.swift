//
//  FrontPageViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol FrontPageViewControllerOutput {
    func viewWillAppear()
}

class FrontPageViewController: UIViewController {
    @IBOutlet weak var frontPageView: FrontPageView!
    
    var router: FrontPageRouterInput!
    var interactor: FrontPageViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FrontPageConfigurator.sharedInstance.configure(viewController: self)
        frontPageView.viewController = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor.viewWillAppear()
    }
}

extension FrontPageViewController: FrontPageViewDelegate {
    func newBillButtonClicked() {
        router.navigateToCreateBill()
    }
}

extension FrontPageViewController: FrontPagePresenterOutput {
    func updateViews(viewModel: FrontPageViewModel) {
        frontPageView.updateViews(viewModel: viewModel)
    }
}
