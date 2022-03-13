//
//  SearchReviewResult.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/09.
//

import SwiftUI

struct SearchReviewResult: View {
    var searchText: String
    var searchResult: [ReviewResData]
    @ObservedObject var searchStatus = SearchStatus()
    
    var body: some View {
        
        ScrollView{
            ForEach(searchResult){
                item in
                HStack(alignment: .top){
                    Text(item.review)
                        .frame(width: 300, alignment: .leading)
                        
                    VStack(alignment: .leading){
                        Text("M:" + String(item.male))
                        Text("F:" + String(item.female))
                    }
                }
                Divider()
                
            }
        }
        .frame(height: 450)
    }
}

struct SearchReviewResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchReviewResult(searchText: "맨투맨",
                           searchResult: [ReviewResData(prd_id: "12345", review: "아디다스 맨투맨 후기진짜 오버핏 제대로인 맨투맨 인생 맨투맨!!!!!", review_id: "12345", male: 0.6, female: 0.4)
                           ]
        )
    }
}
