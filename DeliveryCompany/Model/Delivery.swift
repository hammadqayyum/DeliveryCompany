//
//  Delivery.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 15/08/2023.
//

import Foundation

//struct Delivery: Codable {
//    let id: String
//    let remarks: String
//    let goodsPicture: String
//    let deliveryFee: String
//    let surcharge: String
//    let route: Route
//    let sender: Sender
//}
//
//struct Route: Codable {
//    let start: String
//    let end: String
//}
//
//struct Sender: Codable {
//    let phone, name, email: String
//}




struct Delivery: Codable {
    let id: String
    let remarks: String?
    let pickupTime: String?
    let goodsPicture: String?
    let deliveryFee, surcharge: String?
    let route: Route?
    let sender: Sender?
    let createdAt, name: String?
    let avatar: String?
}

// MARK: - Route
struct Route: Codable {
    let start, end: String
}

// MARK: - Sender
struct Sender: Codable {
    let phone, name, email: String
}

