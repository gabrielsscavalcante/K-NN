//
//  ViewController.swift
//  KNN
//
//  Created by Gabriel Cavalcante on 21/12/16.
//  Copyright © 2016 Gabriel Cavalcante. All rights reserved.
//

import UIKit

struct IrisModal {
    var total = 0
    var type = ""
}

class ViewController: UIViewController {

    var dataIris = DataIris()
    var iris = [Iris]()
    let distance = Distance()
    var corrects = [Iris]()
    var percent = [Double]()
    
    @IBOutlet weak var typeIris: UILabel!
    @IBOutlet weak var imageIris: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var kNumber: UITextField!
    @IBOutlet weak var resultPadrao: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kNumber.delegate = self
        button.layer.cornerRadius = 5
        
        //Pegando objetos Iris a partir dos dados
        iris = dataIris.getArrayOfIris()
        self.imageIris.layer.cornerRadius = self.imageIris.frame.height/2
        self.imageIris.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculate() {
        
        percent.removeAll()
        
        var count = 0
        
        if let number = kNumber.text {
            
            //Escolhendo 10 testes para calcular a distancia para todos as Iris de treinamento
            while count < 10 {
                
                //Pegando 100 para treinamento
                let trainingIris = getRandomIris(allIris: self.iris)
                
                //Pegando o restante para teste
                let testIris = getLeftoversIris(randomIris: trainingIris, allIris: self.iris)
                
                let irisTest = testIris.choose(1)
                
                corrects.removeAll()
                
                //Recebendo as classicações de cada Iris em relacão a distancia, de forma ordenada.
                let classifications = distance.distanceFromRandom(randomIris: trainingIris, iris: irisTest.first!)
                
                //Verificando o total de acertos a partir do número de vizinhos selecionado
                checkCorrectType(iris: irisTest.first!, classifications: classifications, total: Int(number)!)
                
                //Colocando a média de acerto na memoria para depois realizar o somatorio
                percent.append(media(corrects: corrects))
                
                count = count + 1
            }
            
            //Resultado da média total de acertos
            labelResult.text = "Média de Acertos: \(percent.average.roundTo(places: 2))"
            
            //Recebendo a variancia para o desvio padrão a partir do numero de medias
            let varienceResult = variance(media: percent.average, percent: percent)
            resultPadrao.text = "Desvio Padrão: \(varienceResult.squareRoot().roundTo(places: 2))"
            self.imageIris.image = UIImage(named: (corrects.first?.type)!)
            self.typeIris.text = corrects.first?.type
        }
    }
    
    
    //Calculando variancia
    func variance(media: Double, percent: [Double]) -> Double {
        var numbersVariance = [Double]()
        for num in percent {
            let difference = num - media
            numbersVariance.append(pow(difference, 2.0))
        }
        
        return numbersVariance.average
    }
    
    //Calculando média
    func media(corrects: [Iris]) -> Double{
        let media = Double(corrects.count)/Double(Int(kNumber.text!)!)
        return media
    }
    
    //Verificando as Iris corretas em relacão aos k vizinhos
    func checkCorrectType(iris: Iris, classifications: [Classification], total: Int) {
        for i in 0..<total {
            if classifications[i].iris.type == iris.type {
                corrects.append(classifications[i].iris)
            }
        }
    }
    
    //Selecionando 120 aleatoriamente
    func getRandomIris(allIris: [Iris]) -> [Iris] {
        return iris.shuffle().choose(120)
    }
    
    //Selecionando restante de Iris
    func getLeftoversIris(randomIris: [Iris], allIris: [Iris]) -> [Iris] {
        var leftIris = [Iris]()
        for iris in allIris {
            if !(randomIris.contains(iris)) {
                leftIris.append(iris)
            }
        }
        
        return leftIris
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
