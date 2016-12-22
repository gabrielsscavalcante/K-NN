//
//  Iris.swift
//  KNN
//
//  Created by Gabriel Cavalcante on 21/12/16.
//  Copyright © 2016 Gabriel Cavalcante. All rights reserved.
//

import UIKit

class Iris: NSObject {

    var petalLength: Double
    var petalWidth: Double
    var sepalLength: Double
    var sepalWidth: Double
    var type: String
    var id: Int
    
    init(sepalLength: Double, sepalWidth: Double, petalLength: Double, petalWidth: Double, type: String, id: Int) {
        self.sepalLength = sepalLength
        self.sepalWidth = sepalWidth
        self.petalLength = petalLength
        self.petalWidth = petalWidth
        self.type = type
        self.id = id
    }
    
}
