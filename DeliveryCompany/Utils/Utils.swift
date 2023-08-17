//
//  Utils.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 17/08/2023.
//

import Foundation

class Utils {
    
    static var imageData: Data = Data() 
    
    static func calculateTotalCharge(delivery: DeliveryDataModel) -> String {
        if let deliveryFee = Double(delivery.deliveryFeeAmount().replacingOccurrences(of: "$", with: "")) ,
           let surchargeFee = Double(delivery.surchargeFee().replacingOccurrences(of: "$", with: "")) {
            let totalCharge = deliveryFee + surchargeFee
            let formattedTotalAmount = String(format: "%.2f", totalCharge)
            let totalAmount = "$ \(formattedTotalAmount)"
            return totalAmount
        }
        return ""
    }
}


extension Notification.Name {
    static let deliveriesFetched = Notification.Name("deliveriesFetched")
}
