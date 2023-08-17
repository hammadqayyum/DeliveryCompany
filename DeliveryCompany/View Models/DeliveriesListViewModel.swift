//
//  DeliveriesListViewModel.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import Foundation
import RealmSwift

final class DeliveriesListViewModel {
    static let instance = DeliveriesListViewModel()
    var deliveries = [DeliveryDataModel]()
    let realm = try! Realm()
    
    func fetchDeliveries(readFromLocalStorage: Bool = false) {
        Webservice.instance.fetchDeliveries(offset: 0, limit: 20) { (result: Result<[Delivery], NetworkError>) in
            switch result {
            case .success(let deliveries):
                // Process the fetched deliveries
                print(deliveries)
                self.deliveries = deliveries.map{ delivery in
                    DeliveryDataModel(delivery: delivery)}
                
                DispatchQueue.main.async {
                    do {
                        try self.realm.write {
                            self.realm.add(self.deliveries)
                            print("yes added here")
                        }
                    } catch let error as NSError {
                        print("Error saving deliveries: \(error.localizedDescription)")
                    }
                    NotificationCenter.default.post(name: .deliveriesFetched, object: nil)
                }
            case .failure( _):
                // Read from local realm storage
                if readFromLocalStorage {
                    let deliveries = self.realm.objects(DeliveryDataModel.self)
                    for delivery in deliveries {
                        self.deliveries.append(delivery)
                    }
                }
            }
        }
    }
}
