//
//  ProfileDetail.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/22.
//

import SwiftUI

struct ProfileDetail: View {
    
    var userEmail: String
    var userAccessToken: String
    @State private var userMbti: String = ""
    
    var body: some View {
        
        List{
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                Text("유저")
            }
            
            Divider()
            HStack{
                Image(systemName: "figure.wave.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .foregroundColor(.blue)
                Text(self.userMbti)
            }.onAppear(perform: {
                getApiRequestAuth("http://localhost:8000/auth/info", token:self.userAccessToken, parameters: nil){
                    responseObject, error in guard let _ = responseObject, error == nil else {
                        print(error ?? "Unknown error")
                        return
                    }
                    let resData = responseObject!
                    self.userMbti = resData["mbti"] as? String ?? ""
                }
            })
        }
        .listStyle(SidebarListStyle())
        
            
    }
    
    
    func getUserInfo(acToken: String)-> String{
        var userMbti: String = ""
        
        let url = URL(string: "http://localhost:8000/auth/info")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer " + acToken, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,                              // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
                error == nil                                  // was there no error
            else {
                return
            }
            
            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            let resData = responseObject!
            userMbti = resData["mbti"] as? String ?? ""
        }
        task.resume()
        
        return userMbti
    }
    
    
    
}

struct ProfileDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetail(userEmail: "Appnam", userAccessToken: "")
    }
}
