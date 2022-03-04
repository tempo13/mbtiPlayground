//
//  RankDetail.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/02/23.
//

import SwiftUI

struct RankDetail: View {
    var rank: String
    var keyword: String
    
    var body: some View {
        HStack{
            Text(String(format:"%@위 %@",rank, keyword))
                .font(.subheadline)
            Spacer()
        }
    }
}

struct RankDetail_Previews: PreviewProvider {
    static var previews: some View {
        RankDetail(rank:"1", keyword:"제주도")
    }
}
