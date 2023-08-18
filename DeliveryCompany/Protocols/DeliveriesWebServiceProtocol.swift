//
//  DeliveriesWebServiceProtocol.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 18/08/2023.
//

import Foundation

protocol DeliveriesWebServiceProtocol {
    func fetchDeliveries<T: Codable>(offset: Int, limit: Int, completion: @escaping (Result<[T], NetworkError>) -> Void)
}
