//
//  PaymentSchplitterCell.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import NibDesignable

class PaymentSchplitterCell: NibDesignableTableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    func populate(name: String) {
        nameLabel.text = name
    }
}
