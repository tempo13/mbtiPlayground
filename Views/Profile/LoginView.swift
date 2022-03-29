//
//  LoginView.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/16.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginStatus: Bool = false // TODO env 변수로 선언 후 토큰 계속 확인
    @State private var userAccessToken: String = ""
    
    func getUserInfo(acToken: String)-> String{
        var userMbti: String = ""
        getApiRequestAuth("http://localhost:8000/auth/info", token:acToken, parameters: nil){
            responseObject, error in guard let _ = responseObject, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            if responseObject != nil{
                userMbti = responseObject!["data"] as? String ?? ""
            }
            
        }
        return userMbti
    }
    
    var body: some View {
        
        NavigationView{
            if self.loginStatus != false {
                ProfileDetail(userEmail: self.email, userAccessToken: self.userAccessToken)
            } else {
                VStack{
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding()
                        .foregroundColor(.black)
                    HStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.bottom)
                        
                        TextField("이메일을 입력하세요.", text: $email)
                            .frame(width: 300, height: 10)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            
                    }
                    HStack{
                        Image(systemName: "lock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.bottom)
                            
                        SecureField("비밀번호를 입력하세요", text: $password)
                            .frame(width: 300, height: 10)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                    }
                    
                    HStack{
                        Button(action: {
                            print(self.email + self.password)
                            
                            let rft = readItemKeyChain(userId: self.email)
                            if rft != nil {
                                UserDefaults.standard.set(rft, forKey: self.email)
                            }else{
                                sendPostRequest("http://localhost:8000/auth/login", parameters: ["username": self.email, "password": self.password]){
                                    responseObject, error in guard let _ = responseObject, error == nil else {
                                        print(error ?? "Unknown error")
                                        return
                                    }
                                    self.loginStatus = true
                                    
                                    if let rftToken = responseObject{
                                        let rft = rftToken["refresh"] as? String
                                        self.userAccessToken = rftToken["access"] as? String ?? ""
                                        setItemKeyChain(userId: self.email, rft: rft!)
                                        UserDefaults.standard.set(rft, forKey: self.email)
                                    }
                                }
                            }
                        }){
                            Text("로그인")
                                .frame(width: 80, height: 10)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(.systemBlue))
                                .cornerRadius(10)
                                
                        }
                        .padding()
                        
                        NavigationLink(destination: SignUpView()){
                            Text("회원가입")
                                .frame(width: 80, height: 10)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(.systemBlue))
                                .cornerRadius(10)
                        }
                        
                    }
                    
                }
                .padding(.all, 30)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
