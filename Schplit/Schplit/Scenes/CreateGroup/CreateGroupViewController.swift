//
//  CreateGroupViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol CreateGroupViewControllerOutput {
    func titleTextFieldDidEndEditing(text: String?)
    func nameTextFieldDidEndEditing(text: String?)
    func addSchplitterButtonClicked(name: String?)
    func createGroupButtonClicked(group: SchplitGroup)
}

class CreateGroupViewController: UIViewController {
    @IBOutlet weak var createGroupView: CreateGroupView!
    
    var output: CreateGroupViewControllerOutput!
    var router: CreateGroupRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CreateGroupConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGroupView.viewController = self
    }
}

extension CreateGroupViewController: CreateGroupViewDelegate {
    func titleTextFieldDidEndEditing(text: String?) {
        output.titleTextFieldDidEndEditing(text: text)
    }
    
    func nameTextFieldDidEndEditing(text: String?) {
        output.nameTextFieldDidEndEditing(text: text)
    }
    
    func addSchplitterButtonClicked(name: String?) {
        output.addSchplitterButtonClicked(name: name)
    }
    
    func createGroupButtonClicked(group: SchplitGroup) {
        output.createGroupButtonClicked(group: group)
    }
}

extension CreateGroupViewController: CreateGroupPresenterOutput {
    func updateViews(viewModel: CreateGroupViewModel) {
        createGroupView.updateViews(viewModel: viewModel)
    }
    
    func groupCreated(viewModel: CreateGroupViewModel) {
        createGroupView.updateViews(viewModel: viewModel)
        router.navigateToFrontPage()
    }
}
