//
//  AsyncTestUtil.swift
//  Schplit
//
//  Created by Anders Ullnæss on 21/10/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest

class AsyncTestUtil {
    
    class func check(_ expectation: XCTestExpectation, everyMilisec millisec: Int, condition: @escaping () -> Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(millisec)) {
            if condition() {
                expectation.fulfill()
            } else {
                self.check(expectation, everyMilisec: millisec, condition: condition)
            }
        }
    }
}
