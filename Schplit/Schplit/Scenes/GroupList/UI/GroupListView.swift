//
//  GroupListView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol GroupListViewDelegate {
    func newGroupButtonClicked()
    func didSelect(group: SchplitGroup)
}

class GroupListView: NibLoadingView {
    @IBOutlet weak var groupTableView: UITableView!
    
    var viewController: GroupListViewDelegate!
    var viewModel = GroupListViewModel()
    
    let groupCellIdentifier = "GroupCell"
    
    override func awakeFromNib() {
        initTableView()
    }
    
    @IBAction func newGroupButtonClicked(_ sender: UIButton) {
        viewController.newGroupButtonClicked()
    }
    
    func updateViews(viewModel: GroupListViewModel) {
        self.viewModel = viewModel
        
        groupTableView.reloadData()
    }
    
    private func initTableView() {
        groupTableView.register(GroupCell.self, forCellReuseIdentifier: groupCellIdentifier)
        
        groupTableView.estimatedRowHeight = 50
        groupTableView.rowHeight = UITableViewAutomaticDimension
        
        // Remove separators below bottom cell
        groupTableView.tableFooterView = UIView()
    }
}

extension GroupListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCellIdentifier) as! GroupCell
        
        cell.populate(group: viewModel.groups[indexPath.row])
        
        return cell
    }
}

extension GroupListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = viewModel.groups[indexPath.row]
        viewController.didSelect(group: group)
    }
}
