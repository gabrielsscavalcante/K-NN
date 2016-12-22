//
//  ExtensionArray.swift
//  KNN
//
//  Created by Gabriel Cavalcante on 21/12/16.
//  Copyright © 2016 Gabriel Cavalcante. All rights reserved.
//

import UIKit

extension Array {
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        indices.dropLast().forEach {
            guard case let index = Int(arc4random_uniform(UInt32(count - $0))) + $0, index != $0 else { return }
            swap(&self[$0], &self[index])
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}

extension Array {
    var average : Double {
        
        var sum : Double = 0.0
        for value in self {
            sum += value as! Double
        }
        
        return sum / Double(self.count)
        
    }
}
