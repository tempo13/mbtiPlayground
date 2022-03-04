//
//  UserData.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/04.
//

import Foundation

struct UserData: Codable, Hashable, Identifiable {
    var id: Int
    var userId: String
    var profilePic: String
    var userMbti: Array<String>
    var favorite: Array<String>
}
