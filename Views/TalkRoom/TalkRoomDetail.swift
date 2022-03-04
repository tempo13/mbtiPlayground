//
//  TalkRoomDetail.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/03.
//

import SwiftUI

struct TalkRoomDetail: View {
    @Environment(\.presentationMode) var presentationMode
    
    var roomTitle: String
    var mbtiType: Array<String>
    
    let userList = ModelData().userInfos
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.white.ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            VStack(alignment: .leading){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .padding()
                })
                Text(roomTitle)
                    .font(.title)
                    .bold()
                    .padding(.leading)
                    .padding(.top)
                Text(mbtiType.joined(separator: " "))
                    .font(.headline)
                    .bold()
                    .padding(.leading)
                
                Divider()
                
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(userList, id:\.self) {i in
                            ProfileItem(talkRoomTitle: i.userId, imageUrl: i.profilePic)}
                    }
                }.frame(width: .infinity, height: 400)
                Divider()
            }
        }
    }
    
}

struct TalkRoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        TalkRoomDetail(
            roomTitle: "제주도 여행썰",
            mbtiType: ["#ISTJ","#ENFP"]
        )
    }
}
