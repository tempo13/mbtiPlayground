//
//  ContentDetail.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/01.
//

import SwiftUI

struct ContentDetail: View {
    
    var contItem: ContentDetailData
    
    var body: some View {
        VStack(alignment: .leading){
            Group {
                Text(contItem.title)
                    .font(.title)
                    .fontWeight(.black)
                    .padding()
                
                HStack{
                    Text("출처:")
                    Text(contItem.source)
                }
                .font(.subheadline)
                .padding(.leading)
                HStack{
                    Text("작성일:")
                    Text(contItem.published_at)
                }
                .font(.subheadline)
                .padding(.leading)
                HStack{
                    Text("MBTI:")
                    Text(contItem.mbti.joined(separator: " "))
                }
                .font(.subheadline)
                .padding(.leading)
                
                Divider()
                Text(contItem.content)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(
                        minWidth: 300,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: 300,
                        alignment: .topLeading
                    )
                    .padding()
                Divider()
            }
        }
    }
}

struct ContentDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetail(
            contItem: ModelData().contentItems[0]
        ).previewLayout(.fixed(width:310, height:300))
    }
}
