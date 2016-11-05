//
//  CreateGroupViewModel.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

func ==(lhs: CreateGroupViewModel, rhs: CreateGroupViewModel) -> Bool {
    return lhs.titleText == rhs.titleText &&
        lhs.nameText == rhs.nameText &&
        lhs.names == rhs.names
}

class CreateGroupViewModel: Equatable {
    var titleText: String?
    var nameText: String?
    var names: [String] = []
}
