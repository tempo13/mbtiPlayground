//
//  TalkRoomRow.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/01.
//

import SwiftUI

struct TalkRoomRow: View {
    var talkRoomList: [TalkRoom]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("# 톡방 🎙")
                .font(.headline)
                .bold()
                .padding(.leading, 20)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(talkRoomList) { item in
                        NavigationLink{
                            TalkRoomDetail(roomTitle: item.talkTitle, mbtiType: item.category)
                        } label: {
                            TalkRoomItem(talkItem: item)
                        }
                    }
                }
            }
        }
        
    }
}

struct TalkRoomRow_Previews: PreviewProvider {
    static var previews: some View {
        TalkRoomRow(talkRoomList: ModelData().talkRoomList)
    }
}
