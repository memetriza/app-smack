//
//  ChannelCell.swift
//  smack
//
//  Created by Memet RIZA on 18/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var channelLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
        
    }
    func configureCell(channel: Channel){
        let title = channel.channelTitle ?? ""
        channelLbl.text = "#\(title)"
    }

}
