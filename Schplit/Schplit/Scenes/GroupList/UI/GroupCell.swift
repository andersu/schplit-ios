//
//  GroupCell.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import NibDesignable

class GroupCell: NibDesignableTableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var schplittersLabel: UILabel!
    
    func populate(group: SchplitGroup) {
        titleLabel.text = group.title
        schplittersLabel.text = group.names.joined(separator: ", ")
    }
}
