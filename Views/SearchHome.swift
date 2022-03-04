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
        NavigationView{
            List{
                SearchInput(text: $searchText)
                    .frame(height: 40)
                Text("# 인기검색어")
                    .font(.headline)
                    .bold()
                    .padding(.leading, 20)
                    .padding(.bottom, -5)
                Rankrow()
                    .padding(.leading)
                    .background(
                        Color.gray
                        .opacity(0.05)
                    )
                ContentRow(contentList: ModelData().contentItems)
                TalkRoomRow(talkRoomList: ModelData().talkRoomList)
            }
            .navigationTitle("검색")
            .padding(-10)
        }
    }
}

struct SearchHome_Previews: PreviewProvider {
    static var previews: some View {
        SearchHome()
    }
}
