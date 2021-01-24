//
//  ViewController.swift
//  Calculadora_Diana743_Diogo20349
//
//  Created by ISTEC on 22/01/2021.
//  Copyright © 2021 Diana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResult: UILabel!
    
    // Declaração e inicialização de variáveis
    var previousNum : Double = 0
    var currentNumber : Double = 0
    var preTag = "+"
    let tagList = ["+","-","*","/"]
    var decimal : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // Função para guardar o valor do número selecionado
    @IBAction func InputClick(_ sender: UIButton) {
        
        if (displayResult.text! == "0" || displayResult.text! == "+" || displayResult.text! == "-" || displayResult.text! == "*" || displayResult.text! == "/"  ) && !(sender.tag == 0) && !(sender.tag==100){
            displayResult.text = String(sender.tag)
        }
        else if sender.tag == 100 && !decimal{
            decimal = true
            displayResult.text = displayResult.text! + "."
        }
        else if !(displayResult.text! == "0") && !(sender.tag == 100){
            displayResult.text = displayResult.text! + String(sender.tag)
        }
    }
    
    
    @IBAction func ClearResult(_ sender: UIButton) {
        //playSound()
        displayResult.text = "0"
        previousNum = 0
        currentNumber = 0
        preTag = "+"
        decimal = false
    }
    
  
    @IBAction func Calculate(_ sender: UIButton) {
        
       // playSound()
        if previousNum==0 {
            previousNum = Double(displayResult.text!) ?? 0
            decimal = false
        }
        else{
           // decimal = true
            currentNumber = Double(displayResult.text!) ?? 0
            if preTag == "+"{
                previousNum += currentNumber
            }
            else if preTag == "-"{
                previousNum -= currentNumber
            }
            else if preTag == "*"{
                previousNum *= currentNumber
            }
            else if preTag == "/"{
                previousNum /= currentNumber
            }
        }
        
        if sender.tag == 4{
            currentNumber = Double(displayResult.text!) ?? 0
            previousNum = currentNumber/100
                      decimal = true
        }
        
        if sender.tag == 10 || sender.tag == 4{
            decimal = true
            displayResult.text = String(previousNum)
            previousNum = 0
            preTag = "+"
        }
        else{
            displayResult.text = String(tagList[sender.tag])
            preTag = tagList[sender.tag]
        }
    }
    
    
}
