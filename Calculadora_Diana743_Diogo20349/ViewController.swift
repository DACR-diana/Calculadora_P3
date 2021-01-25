//
//  ViewController.swift
//  Calculadora_Diana743_Diogo20349
//
//  Created by ISTEC on 22/01/2021.
//  Copyright © 2021 Diana. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate{

    @IBOutlet weak var displayResult: UILabel!
    
    // Declaração e inicialização de variáveis
    var actualNumber : Double = 0
    var formerNumber : Double = 0
    var prevOperation="="
    
    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    // Função para guardar o valor do número selecionado
    @IBAction func InputClick(_ sender: UIButton) {
        
        KeySound()
        
        
        // Se o valor que está na label do display for un dos caracteres abaixo
        // significa que é um novo calculo, logo o ecra mostra o número selecionado
        
      
        if (displayResult.text == "/" || displayResult.text == "*" || displayResult.text == "+" || displayResult.text == "-" || displayResult.text == "0"  ) && !(sender.tag == 0){
            displayResult.text = String(sender.tag) // atribui o valor do número selecionado à variavel "displayResult" para que seja mostrada no ecra
        }
        else if !(displayResult.text == "0"){
            // Se cair nesta condição significa que o user ainda se encontra a escrever o número que pretence inserir no calculo, ou seja, adiciona ao ecra o número selecionado
            displayResult.text = displayResult.text! + String(sender.tag)
        }
    }
    
    // Limpar o ecra
    @IBAction func ClearResult(_ sender: UIButton) {
        KeySound()
        // inicializar todas as variáveis
        HelperClearDisplay()
    }
    
  
    
    func HelperClearDisplay(){
        displayResult.text = "0"
        formerNumber = 0
        actualNumber = 0
        prevOperation="="
    }
    
    
    
    // Função responsável pelo calculo
    @IBAction func Calculate(_ sender: UIButton) {
        
       KeySound()
        
        let op=sender.titleLabel?.text
        
        // Se o former number for 0 significa que ainda nenhum valor foi gravado
        if (formerNumber==0) {
            
            formerNumber = Double(displayResult.text!) ?? 0
            displayResult.text=String(op!)
            prevOperation=String(op!)
            }
        else{
            actualNumber = Double(displayResult.text!) ?? 0
            print(actualNumber)
            // Verificar se a operação é: dividir por 0
            if(actualNumber==0 && sender.titleLabel?.text=="=" && prevOperation=="/")
            {
                // Se se verificar a condição mostrar uma mensagem de erro e limpa o ecra
                ShowAlertMessage()
                HelperClearDisplay()
        
            }
            else{
                
                // Operações
                if (prevOperation == "+" ){
                    formerNumber += actualNumber
                }
                else if prevOperation == "-"{
                    formerNumber -= actualNumber
                }
                else if prevOperation == "*"{
                    formerNumber *= actualNumber
                }
                else if prevOperation == "/"{
                    formerNumber /= actualNumber
                }
               
                // Mostrar o resultado
               displayResult.text=String(formerNumber)
                prevOperation=String(op!)
            }
        }
        
    }
    
    // Dar play no som da tecla
    func KeySound(){
        
        /*
        let path = Bundle.main.path(forResource: "keySound", ofType:"wav")!
        let url  = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("couldn't load file")
        }
            */
    }
    
    
    // Função com mensagem de erro para quando há uma tentiva de dividir por 0
    func ShowAlertMessage(){
     
        // Alert
        let alert=UIAlertController(title:"AVISO" ,message: "Não é possível dividir por 0", preferredStyle: UIAlertController.Style.alert
        )
        
        // Adicionar botão OK
        alert.addAction(UIAlertAction(title:"OK",style: UIAlertAction.Style.default,handler:nil))
        
        // Config
        self.present(alert, animated:true, completion:nil)
    }
    
    
}
