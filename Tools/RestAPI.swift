//
//  RestAPI.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/20.
//

import Foundation

func sendPostRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
    let targetUrl = URL(string: url)
    let paramData = try? JSONSerialization.data(withJSONObject: parameters)
    
    var request = URLRequest(url: targetUrl!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = paramData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let data = data,                              // is there data
            let response = response as? HTTPURLResponse,  // is there HTTP response
            200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
            error == nil                                  // was there no error
        else {
            completion(nil, error)
            return
        }
        
        let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
        completion(responseObject, nil)
    }
    task.resume()
}

func getApiRequestAuth(_ url: String, token: String, parameters: [String: String]?, completion: @escaping ([String: Any]?, Error?) -> Void){
    var components = URLComponents(string: url)!
    if parameters != nil{
        components.queryItems = parameters!.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    }
    let url = URL(string: url)!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("Bearer ".appending(token), forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let data = data,                              // is there data
            let response = response as? HTTPURLResponse,  // is there HTTP response
            200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
            error == nil                                  // was there no error
        else {
            completion(nil, error)
            return
        }
        
        let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
        completion(responseObject, nil)
    }
    task.resume()
}
