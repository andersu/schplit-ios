//
//  BillView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 22/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

protocol BillViewDelegate {
    
}

class BillView: NibLoadingView {
    var viewController: BillViewDelegate!
    
    func updateViews(viewModel: BillViewModel) {
        
    }
}
