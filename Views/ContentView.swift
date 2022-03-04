//
//  ContentView.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            List{
                SearchInput(text: $searchText)
                    .frame(height: 40)
                    .listRowInsets(EdgeInsets())
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
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
