//
//  CreateBillViewModel.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

func ==(lhs: CreateBillViewModel, rhs: CreateBillViewModel) -> Bool {
    return lhs.titleText == rhs.titleText &&
        lhs.nameText == rhs.nameText &&
        lhs.names == rhs.names
}

class CreateBillViewModel: Equatable {
    var titleText: String?
    var nameText: String?
    var names: [String] = []
}
