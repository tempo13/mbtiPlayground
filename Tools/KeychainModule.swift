//
//  KeychainModule.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/03/21.
//

import Foundation

func setItemKeyChain(userId: String, rft: String){
    let previousQuery: [CFString: Any] = [kSecClass: kSecClassIdentity, kSecAttrAccount: userId]
    
    let updateQuery: [CFString: Any] = [kSecValueData: rft]
    let status = SecItemUpdate(previousQuery as CFDictionary, updateQuery as CFDictionary)
    
    if status == errSecSuccess {
        print("Update!")
    } else {
        print("Update fail")
    }
}

func readItemKeyChain(userId: String)-> String? {
    let query: [CFString: Any] = [kSecClass: kSecClassIdentity, kSecAttrAccount: userId, kSecReturnAttributes: true, kSecReturnData: true]
    var item: CFTypeRef?
    if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess {
        print("Read fail")
        return nil
    }
    
    guard let existingItem = item as? [String: Any] else { return nil }
    guard let data = existingItem[kSecValueData as String] as? Data else { return nil }
    guard let rft = String(data: data, encoding: .utf8) else { return nil }
    
    return rft
}
