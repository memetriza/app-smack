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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Actions
    @IBAction func signUpCloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWİND_TO_CHANNEL, sender: nil)
    }
    
    
}
