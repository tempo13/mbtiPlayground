//
//  TalkRoomDetail.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/03.
//

import SwiftUI

struct TalkRoomDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
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
                    self.showingAlert = true
                }){
                    Text("나가기")
                }.alert(isPresented: $showingAlert){
                    Alert(title: Text("채팅방 나가기"), message: Text("채팅방을 나가시겠습니까?"),
                          primaryButton: .destructive(Text("나가기"), action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                          , secondaryButton: .cancel(Text("취소")))
                }
                .padding()
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
