//
//  MessageService.swift
//  smack
//
//  Created by Memet RIZA on 18/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instanse = MessageService()
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    if let json = try JSON(data: data).array{
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                        completion(true)
                    }
                }catch{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
}
