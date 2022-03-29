//
//  SearchInput.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/02/24.
//

import SwiftUI


class SearchStatus: ObservableObject {
    @Published var isSearch: Bool = false
}


struct SearchInput: View {
    @State var searchKey = ""
    @State private var isEditing = false
    // State 는 프로그램이 실행되는 동안에 프로퍼티의 값이 변경되는 경우 사용
    @ObservedObject var searchStatus = SearchStatus()
    
    @State private var searchResult: [ReviewResData] = []
    @State private var showingAlert = false
    
    var body: some View {
        
        if searchStatus.isSearch == false {
            HStack{
                TextField("검색", text: $searchKey)
                    .onSubmit {
                        sendRequest("http://localhost:8000/search/keyword", parameters: ["search": self.searchKey]){
                            responseObject, error in guard let responseObject = responseObject, error == nil else {
                                print(error ?? "Unknown error")
                                self.showingAlert = true
                                return
                            }
                            let itemList = responseObject["result"] as! [Any]
                            self.searchResult = parseReview(item: itemList)
                            self.searchStatus.isSearch = true
                        }
                    }
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            if isEditing {
                                Button(action: {
                                    self.searchKey = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                    
                                }
                            }
                        }
                    ).onTapGesture {
                        self.isEditing = true
                    }
                    
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchKey = ""
     
                    }) {
                        Text("취소")
                            .padding(.trailing)
                    }
                    .padding(.trailing, 5)
                    .transition(.move(edge: .top))
                    .animation(.easeInOut, value: isEditing)
                }
            }.alert(isPresented: $showingAlert){
                Alert(title: Text("검색 결과"), message: Text("검색 결과가 없습니다."), dismissButton: .default(Text("닫기")))
            }
        } else {
            VStack(alignment: .leading){
                Button(action: {
                    self.searchStatus.isSearch = false
                }){
                    Text("< 뒤로가기")
                }
                SearchReviewResult(searchText: self.searchKey, searchResult: self.searchResult)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
        }
    }
    
    func parseReview(item: [Any]) -> [ReviewResData] {
        var result: [ReviewResData] = []
        for i in 0..<item.count{
            let elm = item[i] as! [String:Any]
            let gender = elm["gender"] as! [String:NSNumber]
            var male = (gender["male"])?.floatValue ?? 0
            var female = (gender["female"])?.floatValue ?? 0
            let prd_id = elm["prd_id"] as! Int
            let review = elm["review"] as! String
            let review_id = elm["review_id"] as! Int
            
            male = round(male * 100) / 100
            female = round(female * 100) / 100
            let reviewItem = ReviewResData(prd_id: String(prd_id), review: review, review_id: String(review_id), male: male, female: female)
            result.append(reviewItem)
            
        }
        return result
    }
    
    
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput()
    }
}
