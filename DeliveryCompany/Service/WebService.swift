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

final class Webservice {
    static let instance = Webservice()
    
    func fetchDeliveries<T: Codable>(offset: Int, limit: Int, completion: @escaping (Result<[T], NetworkError>) -> Void) {
        
        let baseURL = URL(string: "https://6285f87796bccbf32d6c0e6a.mockapi.io/deliveries")!
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]
        
        guard let url = components?.url else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            let newsSourceResponse = try? JSONDecoder().decode([T].self, from: data)
            completion(.success(newsSourceResponse ?? []))
            
        }.resume()
        
    }
}
