//
//  AvatarCell.swift
//  smack
//
//  Created by Memet RIZA on 16/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
