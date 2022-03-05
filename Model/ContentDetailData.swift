//
//  ContentDetailData.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/02.
//

import Foundation
import SwiftUI

struct ContentDetailData: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var content: String
    var source: String
    var published_at: String
    var mbti: Array<String>
    
    private var imageStr: String
    var image: Image {
        Image(imageStr)
    }
}

