//
//  Login.swift
//  fashion
//
//  Created by Ahmed Yamany on 23/08/2022.
//

import Foundation

struct Login: Codable {
    var status: Bool?
    var message: String?
    var data: LoginData?
}

// MARK: - DataClass
struct LoginData: Codable {
    var id: Int?
    var name, email, phone: String?
    var image: String?
    var points, credit: Int?
    var token: String?
}
