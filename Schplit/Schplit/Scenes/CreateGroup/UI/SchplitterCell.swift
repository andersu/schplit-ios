//
//  SchplitterCell.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import NibDesignable

class SchplitterCell: NibDesignableTableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func populate(name: String) {
        nameLabel.text = name
    }
}
