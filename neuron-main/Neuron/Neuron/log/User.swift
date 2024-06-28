//
//  User.swift
//  Neuron
//
//  Created by student on 10.02.2024..
//

import Foundation

struct User : Identifiable, Codable
{
    let id: String
    let name: String
    let email: String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
}

extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, name: "smb", email: "test@gmail")
    
}
