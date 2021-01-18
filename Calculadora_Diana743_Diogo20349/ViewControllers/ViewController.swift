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
    //var preTag = "+"
       
    
    //var modOccured = false
    //var decimal : Bool = false
    
    // Variáveis para o som do click
    var audioPlayer : AVAudioPlayer!
    let clickSound = Bundle.main.url(forResource: "Sounds/key_sound", withExtension: "mp3")
    
    
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
