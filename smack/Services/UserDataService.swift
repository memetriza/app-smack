//
//  UserDataService.swift
//  smack
//
//  Created by Memet RIZA on 16/02/2018.
//  Copyright © 2018 Memet RIZA. All rights reserved.
//

import Foundation
class UserDataService {
    static let instance = UserDataService()
    private(set) public var id = ""
    private(set) public var avatarColor = ""
    private(set) public var avatarName = ""
    private(set) public var email = ""
    private(set) public var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
}
