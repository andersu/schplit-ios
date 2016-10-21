//
//  Bill.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

func ==(lhs: Bill, rhs: Bill) -> Bool {
    return lhs.title == rhs.title &&
        lhs.names == rhs.names
}

class Bill: Equatable {
    var title: String
    var names: [String]
    
    init(title: String, names: [String]) {
        self.title = title
        self.names = names
    }
}
