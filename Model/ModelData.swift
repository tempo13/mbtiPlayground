//
//  ModelData.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/02.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var talkRoomList: [TalkRoom] = load("talkRoomInfo.json")
    @Published var contentItems: [ContentDetailData] = load("contentDetail.json")
    @Published var userInfos: [UserData] = load("talkRoomUsers.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundel.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from:data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
