//
//  ContentData.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/02.
//

import Foundation
import SwiftUI


struct ContentData: Hashable, Codable, Identifiable {
    var id: Int
    var talkTitle: String
    var mbtiType: Array<String>
    
    private var imageStr: String
    var image: Image {
        Image(imageStr)
    }
}
