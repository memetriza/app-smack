//
//  ChatVC.swift
//  smack
//
//  Created by Memet RIZA on 14/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlets
    @IBOutlet weak var channelNameLbl: UILabel!
    
    @IBOutlet weak var manuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        MessageService.instanse.findAllChannel { (success) in
            if success {
                // Codes will come here.
            }
        }
    }
    @objc func userDidChange(_: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        } else {
            channelNameLbl.text = "Please log in"
        }
    }
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    func onLoginGetMessages() {
        MessageService.instanse.findAllChannel { (success) in
            if success {
                // do stuff
            }
        }
    }
    func updateWithChannel() {
        let channelName = MessageService.instanse.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
    }
}
