//
//  Constants.swift
//  DeliveryCompany
//
//  Created by Hammad Qayyum on 17/08/2023.
//

import Foundation

struct DeliveryCellConstants {
    static let verticalSpacing: CGFloat = 6
    static let horizontalSpacing: CGFloat = 12
    static let imageHeightWidht: CGFloat = 100
    static let cornerRadius: CGFloat = 10
}

struct PlaceHolderImage {
    static let placeHolderImage: String = "rectangle"
}

struct DeliveryTableView {
    static let cellIdentifier: String = "DeliveryViewCell"
}

struct StringsConstant {
    static let from: String = "From"
    static let to: String = "To"
    static let delivery: String = "Delivery Fee"
    static let url: String = "https://6285f87796bccbf32d6c0e6a.mockapi.io/deliveries"
    static let offset: String = "offset"
    static let limit: String = "limit"
    static let listTitle: String = "My Deliveries"
    static let summaryTitle: String = "Delivery Details"
    
}

struct DeliverySummaryMainView {
    static let verticalSpacing: CGFloat = 25
    static let horizontalSpacing: CGFloat = 12
    static let favBtnverticalSpacing: CGFloat = 30
    static let favBtnHorizontalSpacing: CGFloat = 8


}

struct DeliveryCellRightConstants {
    static let verticalSpacing: CGFloat = 20
    static let horizontalSpacing: CGFloat = 10
}

struct DeliverySummaryConstants {
    static let verticalSpacing: CGFloat = 24
    static let horizontalSpacing: CGFloat = 16
    static let labelsVerticalSpacing: CGFloat = 20
    static let imageWidhtHeight: CGFloat = 180
    static let cornerRadius: CGFloat = 10
}

struct DeliverySummaryButtonConstants {
    static let verticalSpacing: CGFloat = 15
    static let horizontalSpacing: CGFloat = 10
    static let imageWidhtHeight: CGFloat = 25
    static let fav: String = "heart.fill"
    static let notFav: String = "heart.slash.fill"
}
