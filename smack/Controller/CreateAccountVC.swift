//
//  CreateAccountVC.swift
//  smack
//
//  Created by Memet RIZA on 14/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var userNameTxt: UIStackView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Actions
    @IBAction func signUpCloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWİND_TO_CHANNEL, sender: nil)
    }
    @IBAction func CreateAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        
        guard let pass = passTxt.text , passTxt.text != "" else { return }
        
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("logged in user!",
                        AuthService.instance.authToken)
                    }
                })
                
            }
        }
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
    
}
