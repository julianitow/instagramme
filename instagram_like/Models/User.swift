//
//  User.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import Foundation

struct User: Encodable, Decodable {
    var username: String
    var password: String?
    var email: String?
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
}
