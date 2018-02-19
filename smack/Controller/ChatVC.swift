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
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
    }
    @objc func userDataDidChange(_: Notification) {
        if AuthService.instance.isLoggedIn {
            channelNameLbl.text = "Smack"
            onLoginGetMessages()
        } else {
            channelNameLbl.text = "Please log in"
        }
    }
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    func updateWithChannel() {
        let channelName = MessageService.instanse.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
        getMessages()
    }
    
    func onLoginGetMessages() {
        MessageService.instanse.findAllChannel { (success) in
            if success {
                if MessageService.instanse.channels.count > 0 {
                    MessageService.instanse.selectedChannel = MessageService.instanse.channels[0]
                    self.updateWithChannel()
                }else {
                    self.channelNameLbl.text = "No channels yet"
                }
            }
        }
    }
    func getMessages() {
        guard let channelId = MessageService.instanse.selectedChannel?.id else {return}
        MessageService.instanse.findAllMessagesForChannel(channelId: channelId) { (success) in
            
        }
    }
}
