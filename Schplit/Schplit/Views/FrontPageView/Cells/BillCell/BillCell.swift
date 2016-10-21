//
//  BillCell.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import NibDesignable

class BillCell: NibDesignableTableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var schplittersLabel: UILabel!
    
    func populate(bill: Bill) {
        titleLabel.text = bill.title
        schplittersLabel.text = bill.names.joined(separator: ", ")
    }
}
