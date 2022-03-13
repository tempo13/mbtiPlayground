//
//  ReviewResData.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/09.
//

import Foundation
import SwiftUI


struct ReviewResData: Hashable, Codable, Identifiable{
    var prd_id: String
    var review: String
    var review_id: String
    var id: String { review_id }
    
    var male: Float
    var female: Float
}
