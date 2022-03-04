//
//  SearchInput.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/02/24.
//

import SwiftUI

struct SearchInput: View {
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack{
            TextField("검색어를 입력하세요", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
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
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                )
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                    // Dismis keyboard
//                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("삭제")
                        .padding(.trailing)
                        
                }
                .padding(.trailing, 5)
                .transition(.move(edge: .top))
                .animation(.easeInOut, value: isEditing)

            }
        }
    }
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput(text: .constant(""))
    }
}
