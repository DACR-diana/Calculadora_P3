//
//  ViewController.swift
//  Calculadora_Diana743_Diogo20349
//
//  Created by ISTEC on 18/01/2021.
//  Copyright © 2021 Diana. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // Ligaçao c/ a label que mostra o resultado
    @IBOutlet weak var resultDisplay: UILabel!
    
 
    // Declaraçao/Inicializaçao de variáveis
    let operationsList = ["+","-","*","/"]
    var previousNum : Double = 0
    var actualNum : Double = 0
    var preTag = "+"
       
    
    var modOccured = false
    var decimal : Bool = false
    
    // Variáveis para o som do click
    var audioPlayer : AVAudioPlayer!
    let clickSound = Bundle.main.url(forResource: "Sounds/key_sound", withExtension: "mp3")
    
    
    // Função para limpar o resultado
    @IBAction func ClearDisplay(_ sender: UIButton) {
        // Play efeito sonoro
         playKeyPressSoundEffect()
        
        
        // Inicializar todas as variáveis
        resultDisplay.text="0"
               previousNum = 0
               actualNum = 0
               preTag = "+"
               modOccured = false
               decimal = false
        
    }
    
    
    // Calcular e mostrar o resultado
    @IBAction func Calculate(_ sender: UIButton) {
        
        // Play efeito sonoro
               playKeyPressSoundEffect()
        
        
        if previousNum==0 {
                   previousNum = Double(resultDisplay.text!) ?? 0
                   decimal = false
               }
               else{
                  
                   actualNum = Double(resultDisplay.text!) ?? 0
                   if preTag == "+"{
                       previousNum += actualNum
                   }
                   else if preTag == "-"{
                       previousNum -= actualNum
                   }
                   else if preTag == "*"{
                       previousNum *= actualNum
                   }
                   else if preTag == "/"{
                       previousNum /= actualNum
                   }
               }
               
               if sender.tag == 4{
                   actualNum = Double(resultDisplay.text!) ?? 0
                   previousNum = actualNum/100
                   modOccured = true
                   decimal = true
               }
               
               if sender.tag == 10 || sender.tag == 4{
                   decimal = true
                   resultDisplay.text = String(previousNum)
                   previousNum = 0
                   preTag = "+"
               }
               else{
                   resultDisplay.text = String(operationsList[sender.tag])
                   preTag = operationsList[sender.tag]
               }
    }
    
    
    
    
    // Números
    @IBAction func ClickNumbers(_ sender: UIButton) {
        
         // Play efeito sonoro
                playKeyPressSoundEffect()
        
        
               if (resultDisplay.text! == "+" || resultDisplay.text! == "-" || resultDisplay.text! == "*" || resultDisplay.text! == "/" || modOccured ) && !(sender.tag == 0) && !(sender.tag==100){
                   resultDisplay.text = String(sender.tag)
               }
               else if sender.tag == 100 && !decimal{
                   decimal = true
                   resultDisplay.text = resultDisplay.text! + "."
               }
               else if !(resultDisplay.text! == "0") && !(sender.tag == 100){
                   resultDisplay.text = resultDisplay.text! + String(sender.tag)
               }    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Funçao encarregue do efeito sonoro
     func playKeyPressSoundEffect(){
           audioPlayer = try? AVAudioPlayer(contentsOf: clickSound!)
           audioPlayer.play()
           
       }
    
    
    
}
