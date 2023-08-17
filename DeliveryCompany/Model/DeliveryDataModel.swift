//
//  DeliveryDataModel.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 16/08/2023.
//

import Foundation

final class DeliveryDataModel {
    private(set) var goodsPicture: String
    private(set) var deliveryFee: String
    private(set) var surcharge: String
    private(set) var toReciever: String
    private(set) var fromSender: String
    private(set) var remarks: String
    var isFavourite: Bool = false
    var imageData = Data()
    private(set) var totalAmount: String = ""
    
    init(delivery: Delivery) {
        self.goodsPicture = delivery.goodsPicture
        self.deliveryFee  = delivery.deliveryFee
        self.surcharge    = delivery.surcharge
        self.toReciever   = delivery.route.end
        self.fromSender   = delivery.sender.name
        self.remarks      = delivery.remarks
        calculateTotalCharge()
    }
    
    private func calculateTotalCharge() {
        if let deliveryFee = Double(self.deliveryFee.replacingOccurrences(of: "$", with: "")) ,
           let surchargeFee = Double(self.surcharge.replacingOccurrences(of: "$", with: "")) {
            let totalCharge = deliveryFee + surchargeFee
            let formattedTotalAmount = String(format: "%.2f", totalCharge)
            totalAmount = "$ \(formattedTotalAmount)"
        }
    }
}
