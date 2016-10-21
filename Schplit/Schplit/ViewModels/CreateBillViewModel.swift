//
//  CreateBillViewModel.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

func ==(lhs: CreateBillViewModel, rhs: CreateBillViewModel) -> Bool {
    return lhs.names == rhs.names
}

class CreateBillViewModel: Equatable {
    var names: [String] = []
}
