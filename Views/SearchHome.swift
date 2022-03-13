//
//  SearchHome.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/02/23.
//

import SwiftUI

struct SearchHome: View {
    
    @State private var searchText = ""
    
    var body: some View {
        List{
            Text("# 인기검색어")
                .padding(.leading, 10)
                .font(.headline)
                .listRowInsets(EdgeInsets())
            Rankrow()
                .padding(.leading)
                .background(
                    Color.gray
                    .opacity(0.05)
                )
                .listRowInsets(EdgeInsets())
            ContentRow(contentList: ModelData().contentItems)
                .listRowInsets(EdgeInsets())
            TalkRoomRow(talkRoomList: ModelData().talkRoomList)
                .listRowInsets(EdgeInsets())
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("MBTI 검색엔진")
    }
}

struct SearchHome_Previews: PreviewProvider {
    static var previews: some View {
        SearchHome()
    }
}
