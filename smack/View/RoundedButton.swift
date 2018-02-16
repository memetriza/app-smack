//
//  RoundedButton.swift
//  smack
//
//  Created by Memet RIZA on 15/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
