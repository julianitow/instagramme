//
//  Network.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    @Published var users: [User] = []
    
    let baseUrl = "http://10.0.0.11:3000/"
    
    func signup(user: User, completion: @escaping (User?) -> Void) {
        let url = URL(string: baseUrl + "signup")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            request.addValue("Application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil,
                      data != nil else {
                    return
                }
                do {
                    let jsonData = try JSONDecoder().decode(User.self, from: data!)
                    completion(jsonData)
                } catch {
                    print(error)
                    completion(nil)
                }
            }
            dataTask.resume()
        } catch {
            print(error)
        }
    }
    
    func signin(user: User, completion: @escaping (User?) -> Void) {
        let url = URL(string: baseUrl + "signin")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            request.addValue("Application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard error == nil,
                      data != nil else {
                    return
                }
                do {
                    let jsonData = try JSONDecoder().decode(User.self, from: data!)
                    completion(jsonData)
                } catch {
                    print(error)
                    completion(nil)
                }
            }
            dataTask.resume()
        } catch {
            print(error)
        }
    }
}
