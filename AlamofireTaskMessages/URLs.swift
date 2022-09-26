//
//  URLs.swift
//  AlamofireTaskMessages
//
//  Created by Esraa Khaled   on 13/09/2022.
//

import Foundation

final class URLs {
    
    static let shared = URLs()
    private init() {}
    
    private var baseURL = "http://triplemm.net/app/api/"
    
    enum Services: String {
        case addNewMessage = "add-chat.php"
        case getMessages = "get-chat.php"
    }
    
    func getURL(for service: Services) -> String {
        return baseURL + service.rawValue
    }
}
