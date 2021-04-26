//
//  ViewController.swift
//  SuperSenha
//
//  Created by Ian Manor on 15/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLowercaseLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swUppercaseLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var theButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        buttonHidden()
        let passwordsViewController = segue.destination as! PasswordsViewController

        // forma mais segura (usar if let)
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            // se conseguir obter o valor do campo e converter para inteiro
            if numberOfPasswords == 0 || numberOfPasswords > 12{
                let alert = UIAlertController(title: "Quantidade de senha incorreta", message: "O valor deve ser de 1 ate 12", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                
                self.present(alert, animated: true, completion: nil)
            }else{
            passwordsViewController.numberOfPasswords = numberOfPasswords
            }
            
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            if numberOfCharacters == 0 || numberOfCharacters > 16{
                let alert = UIAlertController(title: "Quantidade de caracteres incorreta", message: "O valor deve ser de 1 ate 16", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                
                self.present(alert, animated: true, completion: nil)
            }else{
            passwordsViewController.numberOfCharacters = numberOfCharacters
            }
        
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useUppercaseLetters = swUppercaseLetters.isOn
        passwordsViewController.useLowercaseLetters = swLowercaseLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn

        // forcar encerrar o modo de edicao // remove o foco e libera teclado
        view.endEditing(true)
    }
    
        

    
    }
    
    func buttonHidden(){
        
        if swNumbers.isOn == false && swLowercaseLetters.isOn == false && swUppercaseLetters.isOn == false && swSpecialCharacters.isOn == false
        {
            theButton.isEnabled = false
            
        
        }else{
            theButton.isEnabled = true
        }
        
    }
    
    @IBAction func gerarSenha(_ sender: Any) {
        
        
    }
}


