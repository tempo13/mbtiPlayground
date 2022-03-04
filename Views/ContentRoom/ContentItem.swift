//
//  ContentItem.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/01.
//

import SwiftUI

struct ContentItem: View {
    var contentData: ContentDetailData
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .leading){
                contentData.image
                    .resizable()
                    .overlay{
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .opacity(0.3)
                    }
                    .frame(width:100, height: 100)
                    .clipShape(Rectangle())
                    .cornerRadius(8)
                    .overlay(alignment: .top){
                        VStack{
                            Text(contentData.mbti.joined(separator: " "))
                                .frame(width: 80, height: 50, alignment: .topLeading)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .minimumScaleFactor(0.5)
                                .padding(.top, 10)
                            
                        }
                    }
            }
            
            Text(contentData.title)
                .font(.headline)
                .bold()
                .foregroundColor(.black)
                .frame(width:100)
                .lineLimit(1)
                .padding(0)
                
        }.padding()
    }
}

struct ContentItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentItem(
            contentData: ModelData().contentItems[0]
        )
    }
}
