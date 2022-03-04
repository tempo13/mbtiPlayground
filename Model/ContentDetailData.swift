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
    
//    init(title: String, content: String, source: String, published_at:String, mbti: Array<String>){
//        self.title = title
//        self.content = content
//        self.source = source
//        self.published_at = published_at
//        self.mbti = mbti
//    }
    
}

