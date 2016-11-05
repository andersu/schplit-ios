//
//  GroupViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupViewControllerOutput {
    func viewDidLoad(group: SchplitGroup)
}

class GroupViewController: UIViewController {
    @IBOutlet weak var groupView: GroupView!
    
    // Set by SchplitGroup when navigating here
    var group: SchplitGroup!
    
    var output: GroupViewControllerOutput!
    var router: GroupRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GroupConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupView.viewController = self
        
        output.viewDidLoad(group: group)
    }
}

extension GroupViewController: GroupViewDelegate {
    func newPaymentButtonClicked() {
        router.navigateToCreatePayment(group: group)
    }
}

extension GroupViewController: GroupPresenterOutput {
    func updateViews(viewModel: GroupViewModel) {
        navigationItem.title = viewModel.group?.title
        
        groupView.updateViews(viewModel: viewModel)
    }
}
