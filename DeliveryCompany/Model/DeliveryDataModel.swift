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
    @Persisted private var goodsPicture: String
    @Persisted private var deliveryFee: String
    @Persisted private var surcharge: String
    @Persisted private var toReciever: String
    @Persisted private var fromSender: String
    @Persisted private var remarks: String
    @Persisted private var isFavourite: Bool = false
    
    convenience init(delivery: Delivery) {
        self.init()
        self.goodsPicture = delivery.goodsPicture
        self.deliveryFee  = delivery.deliveryFee
        self.surcharge    = delivery.surcharge
        self.toReciever   = delivery.route.end
        self.fromSender   = delivery.sender.name
        self.remarks      = delivery.remarks
    }
    
    func updateIsFavourite() {
        self.isFavourite = !self.isFavourite
    }
    
    func favouriteStatus() -> Bool {
        return self.isFavourite
    }
    
    func goodsPictureUrl() -> String {
        return self.goodsPicture
    }
    
    func senderName() -> String {
        return self.fromSender
    }
    
    func recieverName() -> String {
        self.toReciever
    }
    
    func deliveryFeeAmount() -> String {
        self.deliveryFee
    }
    
    func surchargeFee() -> String {
        self.surcharge
    }
    
    func deliveryRemarks() -> String {
        self.remarks
    }
}
