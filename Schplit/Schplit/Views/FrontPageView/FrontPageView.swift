//
//  FrontPageView.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol FrontPageViewDelegate {
    func newBillButtonClicked()
}

class FrontPageView: NibLoadingView {
    var viewController: FrontPageViewDelegate!
    
    @IBAction func newBillButtonClicked(_ sender: UIButton) {
        viewController.newBillButtonClicked()
    }
}
