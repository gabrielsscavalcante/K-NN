//
//  Distance.swift
//  KNN
//
//  Created by Gabriel Cavalcante on 21/12/16.
//  Copyright © 2016 Gabriel Cavalcante. All rights reserved.
//

import UIKit

class Distance: NSObject {

    //Calculando a distancia
    func distance(sepalLength: Double, sepalWidth: Double, petalLength: Double, petalWidth: Double, iris: Iris) -> Double {
        let difSepalLength = differencePow(one: sepalLength, two: iris.sepalLength)
        let difSepalWidth = differencePow(one: sepalWidth, two: iris.sepalWidth)
        let difPetalLength = differencePow(one: petalLength, two: iris.petalLength)
        let difPetalWidth = differencePow(one: petalWidth, two: iris.petalWidth)
        
        return (difSepalLength + difSepalWidth + difPetalLength + difPetalWidth).squareRoot()
    }
    
    //Tirando a diferenca e elevando ao quadrado
    func differencePow(one: Double, two: Double) -> Double {
        let difference = (one - two)
        return pow(difference, 2.0)
    }
    
    //Classificando as distancias de forma ordenada
    func distanceFromRandom(randomIris: [Iris], iris: Iris) -> [Classification] {
        var classifications = [Classification]()
        for random in randomIris {
            let distanceFromRandom = distance(sepalLength: iris.sepalLength, sepalWidth: iris.sepalWidth, petalLength: iris.petalLength, petalWidth: iris.petalWidth, iris: random)
            
            let classification = Classification(iris: random, distanceFrom: distanceFromRandom)
            classifications.append(classification)
        }
        
        let classificationSorted = classifications.sorted() { $0.distanceFrom < $1.distanceFrom }
        
        for iris in classificationSorted {
            print("\(iris.distanceFrom) - \(iris.iris.id) - \(iris.iris.type) - \(iris.iris.sepalLength) \(iris.iris.sepalWidth) \(iris.iris.petalLength) \(iris.iris.petalWidth)")
        }
        
        return classificationSorted
    }
}
