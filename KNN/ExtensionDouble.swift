//
//  ExtensionDouble.swift
//  KNN
//
//  Created by Gabriel Cavalcante on 22/12/16.
//  Copyright © 2016 Gabriel Cavalcante. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
