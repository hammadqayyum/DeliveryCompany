//
//  DeliveriesListViewModel.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import Foundation

final class DeliveriesListViewModel {
    static let instance = DeliveriesListViewModel()
    var deliveries = [DeliveryDataModel]()
    
    func fetchDeliveries() {
        Webservice.instance.fetchDeliveries(offset: 0, limit: 20) { (result: Result<[Delivery], NetworkError>) in
            switch result {
            case .success(let deliveries):
                // Process the fetched deliveries
                print(deliveries)
                self.deliveries = deliveries.map{ delivery in
                    DeliveryDataModel(delivery: delivery)}
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .deliveriesFetched, object: nil)
                }
            case .failure(let error):
                // Handle the error
                print("Error: \(error)")
            }
        }
    }
}
