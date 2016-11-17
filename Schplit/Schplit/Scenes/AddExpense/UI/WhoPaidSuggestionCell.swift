//
//  WhoPaidSuggestionCell.swift
//  Schplit
//
//  Created by Anders Ullnæss on 17/11/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import NibDesignable

class WhoPaidSuggestionCell: NibDesignableTableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func populate(name: String) {
        nameLabel.text = name
    }
}
