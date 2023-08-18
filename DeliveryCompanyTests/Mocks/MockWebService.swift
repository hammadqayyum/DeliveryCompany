//
//  MockWebService.swift
//  DeliveryCompanyTests
//
//  Created by Hammad Qayyum on 18/08/2023.
//

import Foundation
import XCTest
@testable import DeliveryCompany


final class MockWebService: DeliveriesWebServiceProtocol {
    var shouldReturnError = false
    var numberOfItemsToReturn = 20
    
    func fetchDeliveries<T: Codable>(offset: Int, limit: Int, completion: @escaping (Result<[T], DeliveryCompany.NetworkError>) -> Void)  {
        if shouldReturnError {
            completion(.failure(.badUrl))
        } else {
            let route = Route(start: "start", end: "end")
            let sender = Sender(phone: "1234567890", name: "HQ", email: "ha@gmail.com")
            let delivery = Delivery(id: "1", remarks: "Fragile", goodsPicture: "http://google.com", deliveryFee: "10.00", surcharge: "5.00", route: route, sender: sender)
            let deliveries = (0..<numberOfItemsToReturn).map { _ in delivery }
            completion(.success(deliveries as! [T]))
        }
    }

}
