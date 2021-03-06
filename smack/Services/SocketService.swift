//
//  SocketService.swift
//  smack
//
//  Created by Memet RIZA on 19/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    override init() {
        super.init()
    }
    let socket = SocketManager(socketURL: (URL(string: BASE_URL)!), config: [.log(true), .compress])
    
    func establishConnection() {
        socket.defaultSocket.connect()
    }
    func closeConnection() {
        socket.defaultSocket.disconnect()
    }
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.defaultSocket.emit(SOCKET_EVT_NEW_CHANNEL, channelName, channelDescription)
        completion(true)
    }
    func getChannel(completion: @escaping CompletionHandler) {
        socket.defaultSocket.on(SOCKET_EVT_CHANNEL_CREATED) { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, id: channelId)
            MessageService.instanse.channels.append(newChannel)
            completion(true)
        }
    }
    
    
}
