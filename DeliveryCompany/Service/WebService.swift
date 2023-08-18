//
//  WebService.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidData
    case decodingError
}

final class Webservice: DeliveriesWebServiceProtocol {
    
    func fetchDeliveries<T: Codable>(offset: Int, limit: Int, completion: @escaping (Result<[T], NetworkError>) -> Void) {
        
        let baseURL = URL(string: StringsConstant.url)!
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: StringsConstant.offset, value: "\(offset)"),
            URLQueryItem(name: StringsConstant.limit, value: "\(limit)")
        ]
        
        guard let url = components?.url else {
            completion(.failure(.badUrl))
            return
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        let session = URLSession(configuration: configuration)
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            let newsSourceResponse = try? JSONDecoder().decode([T].self, from: data)
            completion(.success(newsSourceResponse ?? []))
            
        }.resume()
        
    }
}
