//
//  ContentRow.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/01.
//

import SwiftUI

struct ContentRow: View {
    var contentList: [ContentDetailData]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("# 추천콘텐츠")
                .font(.headline)
                .bold()
                .padding(.leading, 20)
                .padding(.bottom, -8)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(contentList) { item in
                        NavigationLink{
                            ContentDetail(contItem: item)
                        } label: {
                            ContentItem(contentData: item)
                        }
                    }
                }
            }
        }
    }
}

struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentRow(contentList: ModelData().contentItems)
    }
}
