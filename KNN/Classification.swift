//
//  Classification.swift
//  KNN
//
//  Created by Gabriel Cavalcante on 21/12/16.
//  Copyright © 2016 Gabriel Cavalcante. All rights reserved.
//

import UIKit

class Classification: NSObject {

    var iris: Iris
    var distanceFrom: Double
    
    init(iris: Iris, distanceFrom: Double) {
        self.iris = iris
        self.distanceFrom = distanceFrom
    }
}
