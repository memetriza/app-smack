//
//  RoundedView.swift
//  smack
//
//  Created by Memet RIZA on 19/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit
class RoundedView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
    }
}
