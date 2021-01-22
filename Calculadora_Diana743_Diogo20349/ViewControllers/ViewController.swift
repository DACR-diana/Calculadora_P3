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
    

    @IBOutlet weak var labelDisplay: UILabel!

    var previousNum : Double = 0
    var currentNumber : Double = 0
    var preTag = "+"
    let tagList = ["+","-","*","/"]
    var modOccured = false
    var decimal : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ClickFunction(_ sender: UIButton) {
        print(sender.tag)
        if (labelDisplay.text! == "0" || labelDisplay.text! == "+" || labelDisplay.text! == "-" || labelDisplay.text! == "*" || labelDisplay.text! == "/" || modOccured ) && !(sender.tag == 0) && !(sender.tag==100){
            labelDisplay.text = String(sender.tag)
        }
        else if sender.tag == 100 && !decimal{
            decimal = true
            labelDisplay.text = labelDisplay.text! + "."
        }
        else if !(labelDisplay.text! == "0") && !(sender.tag == 100){
            labelDisplay.text = labelDisplay.text! + String(sender.tag)
        }
    }

    
    
    
}
