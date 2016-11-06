//
//  GroupListViewController.swift
//  Schplit
//
//  Created by Anders Ullnæss on 05/11/16.
//  Copyright (c) 2016 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GroupListViewControllerOutput {
    func viewWillAppear()
    func didSelect(group: SchplitGroup)
}

class GroupListViewController: UIViewController {
    @IBOutlet weak var groupListView: GroupListView!
    
    var output: GroupListViewControllerOutput!
    var router: GroupListRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GroupListConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupListView.viewController = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension GroupListViewController: GroupListViewDelegate {
    func newGroupButtonClicked() {
        router.navigateToCreateGroupScene()
    }
    
    func didSelect(group: SchplitGroup) {
        output.didSelect(group: group)
        router.navigateToGroupScene(group: group)
    }
}

extension GroupListViewController: GroupListPresenterOutput {
    func updateViews(viewModel: GroupListViewModel) {
        groupListView.updateViews(viewModel: viewModel)
    }
}
