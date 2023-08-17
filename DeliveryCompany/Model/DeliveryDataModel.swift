//
//  DeliveryDataModel.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import Foundation
import RealmSwift

final class DeliveryDataModel: Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted private(set) var goodsPicture: String
    @Persisted private(set) var deliveryFee: String
    @Persisted private(set) var surcharge: String
    @Persisted private(set) var toReciever: String
    @Persisted private(set) var fromSender: String
    @Persisted private(set) var remarks: String
    @Persisted var isFavourite: Bool = false
    
    convenience init(delivery: Delivery) {
        self.init()
        self.goodsPicture = delivery.goodsPicture
        self.deliveryFee  = delivery.deliveryFee
        self.surcharge    = delivery.surcharge
        self.toReciever   = delivery.route.end
        self.fromSender   = delivery.sender.name
        self.remarks      = delivery.remarks
    }
}
