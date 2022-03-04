//
//  TalkRoomInfo.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/03.
//

import Foundation
import SwiftUI

struct TalkRoom: Codable, Hashable, Identifiable {
    var id: Int
    var category: Array<String>
    var talkTitle: String
    
    private var imageStr: String
    var image: Image {
        Image(imageStr)
    }
    var icon: String
}
