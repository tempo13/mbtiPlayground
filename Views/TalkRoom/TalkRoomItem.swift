//
//  TalkRoomItem.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/01.
//

import SwiftUI

struct TalkRoomItem: View {
    
    
    var talkItem: TalkRoom
    
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                talkItem.image
                    .resizable()
                    .overlay{
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .opacity(0.3)
                    }
                    .frame(width:100, height: 100)
                    .clipShape(Rectangle())
                    .cornerRadius(30)
                    .overlay(alignment: .top){
                        VStack{
                            Text(talkItem.category.joined(separator: " "))
                                .frame(width: 80, height: 50, alignment: .topLeading)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .minimumScaleFactor(0.5)
                                .padding(.top, 10)
                            Circle()
                                .strokeBorder(Color.gray, lineWidth: 1)
                                .background(Circle().foregroundColor(.white))
                                .frame(width: 50, height: 50)
                                .overlay{
                                    Text(talkItem.icon)
                                        .font(.system(size: 40))
                                }
                            
                        }
                        
                        
                    }
                
            }
        }.padding()
    }
}

struct TalkRoomItem_Previews: PreviewProvider {
    static var previews: some View {
        TalkRoomItem(talkItem: ModelData().talkRoomList[0])
    }
}
