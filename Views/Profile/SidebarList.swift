//
//  SidebarList.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/05.
//

import SwiftUI

struct SidebarList: View {
    var body: some View {
        
        List{
            Button{
                print("User Button")
            } label: {
                HStack{
                    contentList(iconName: "person.crop.circle", titleElm:
                                    Text("User")
                                    .font(.system(size: 30))
                                    .bold()
                    )
                }
            }
        
            
            Divider()
            Group{
                Button{
                    print("content")
                } label: {
                    contentList(iconName: "pencil.circle", title: "콘텐츠 검색")
                }
                Button{
                    print("Chatting Room")
                } label: {
                    contentList(iconName: "message.and.waveform.fill", title: "채팅방")
                }
                
            }
        }.listStyle(SidebarListStyle())
        
    }
}

@ViewBuilder
func contentList(iconName:String, title:String? = nil, titleElm: Text? = nil)-> some View {
    HStack{
        Image(systemName: iconName)
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundColor(.blue)
        if title != nil {
            Text(title!)
                .font(.system(size: 20))
                .bold()
        }
        
        if titleElm != nil{
            titleElm
        }
    }
    
}

struct SidebarList_Previews: PreviewProvider {
    static var previews: some View {
        SidebarList()
    }
}
