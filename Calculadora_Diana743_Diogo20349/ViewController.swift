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
    

    @IBAction func InputClick(_ sender: UIButton) {
        print(sender.tag)
                      if (displayResult.text! == "0" || displayResult.text! == "+" || displayResult.text! == "-" || displayResult.text! == "*" || displayResult.text! == "/" || modOccured ) && !(sender.tag == 0) && !(sender.tag==100){
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
