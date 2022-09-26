//
//  Product.swift
//  AlamofireTaskMessages
//
//  Created by Esraa Khaled   on 13/09/2022.
//

import Foundation

// MARK: - Welcome
struct Products: Codable {
    let success: Int?
    let product: [Product]?
}

// MARK: - Product
struct Product: Codable {
    let id, orderID, orderType, driverID: String?
    let clientID: String?
    let text: String?
    let isSeen, date, fromTo: String?
    let clientName, driverName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case orderType = "order_type"
        case driverID = "driver_id"
        case clientID = "client_id"
       case text
        case isSeen = "is_seen"
        case date
        case fromTo = "from_to"
        case clientName = "client_name"
        case driverName = "driver_name"
    }
}
