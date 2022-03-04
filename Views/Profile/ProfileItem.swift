//
//  ProfileItem.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/03.
//

import SwiftUI

struct ProfileItem: View {
    var talkRoomTitle: String
    var imageUrl: String
    
    
    var body: some View {
        VStack(alignment: .leading){
            Circle()
                .overlay(
                    AsyncImage(
                        url: URL(string: imageUrl),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                )
                .frame(width: 100, height: 100)
            Text(talkRoomTitle)
                .frame(width: 100)
                .lineLimit(2)
                .font(.subheadline)
        }
            
        
    }
}

struct ProfileItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItem(
            talkRoomTitle: "John",
            imageUrl: "https://cdn.pixabay.com/photo/2015/03/03/18/58/woman-657753_960_720.jpg"
        )
    }
}
