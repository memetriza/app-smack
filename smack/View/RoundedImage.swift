//
//  RoundedImage.swift
//  smack
//
//  Created by Memet RIZA on 17/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }


}
