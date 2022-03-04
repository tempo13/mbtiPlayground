//
//  Rankrow.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/02/23.
//

import SwiftUI

struct Rankrow: View {
    @State private var items = ["제주도", "원피스", "애플망고", "책", "여행", "연애"]
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 4) {
                    ForEach(0..<items.count){ i in
                        RankDetail(rank: String(format:"%d", i + 1), keyword: self.items[i])
                            .frame(height:30)
                            .padding(.leading, 10)
                    }
                }
            }
            .frame(height: 160)
        }
    }
}

struct Rankrow_Previews: PreviewProvider {
    static var previews: some View {
        Rankrow()
    }
}
