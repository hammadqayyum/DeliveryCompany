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
    private let pageSize = 20
    var isPaginationNeeded = true
    var servicesCount = 0
    
    
    func duplicateObjects(array: [Delivery], n: Int) -> [Delivery] {
      var newArray = [Delivery]()
      for _ in 0..<n {
        for delivery in array {
          newArray.append(delivery)
        }
      }
      return newArray
    }
    
    func fetchDeliveries(readFromLocalStorage: Bool = false) {
        if servicesCount > 0 {
            return
        }
        servicesCount += 1
        let offset = deliveries.count
        Webservice.instance.fetchDeliveries(offset: offset, limit: pageSize) { (result: Result<[Delivery], NetworkError>) in
            switch result {
            case .success(let deliveries):
                // Process the fetched deliveries
                print(deliveries)
                var nextDeliver = [Delivery]()
                nextDeliver.append(contentsOf: deliveries)
                nextDeliver.append(contentsOf: self.duplicateObjects(array: deliveries, n: 5))
                
                let mappedDeliveries = nextDeliver.map { delivery in
                    DeliveryDataModel(delivery: delivery)}
                self.isPaginationNeeded = mappedDeliveries.count >= self.pageSize
                DispatchQueue.main.async {
                    do {
                        try self.realm.write {
                            self.deliveries.append(contentsOf: mappedDeliveries)
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
                    NotificationCenter.default.post(name: .deliveriesFetched, object: nil)
                }
            }
            self.servicesCount -= 1
        }
    }
}
