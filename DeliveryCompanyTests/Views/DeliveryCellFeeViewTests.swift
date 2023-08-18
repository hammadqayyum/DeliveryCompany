//
//  DeliveryCellFeeViewTests.swift
//  DeliveryCompanyTests
//
//  Created by Hammad Qayyum on 18/08/2023.
//

import XCTest
@testable import DeliveryCompany

final class DeliveryCellFeeViewTests: XCTestCase {
    var delivery: DeliveryDataModel!
    var deliveryFeeView: DeliveryCellFeeView!
    
    override func setUp() {
        super.setUp()
        let route = Route(start: "start", end: "end")
        let sender = Sender(phone: "1234567890", name: "HQ", email: "ha@gmail.com")
        let delivery = Delivery(id: "1", remarks: "Fragile", goodsPicture: "http://google.com", deliveryFee: "10.00", surcharge: "5.00", route: route, sender: sender)
        self.delivery = DeliveryDataModel(delivery: delivery)
        deliveryFeeView = DeliveryCellFeeView()
    }
    
    func test_TopRightImageViewIsVisible_WhenFavouriteStatusIsTrue() {
        // Given
        delivery.updateIsFavourite()
        
        // When
        deliveryFeeView.updateView(delivery: delivery)
        
        // Then
        XCTAssertFalse(deliveryFeeView.isTopRightImageViewHidden, "The topRightImageView should be visible when is fav is true.")
    }
    
    func test_TopRightImageViewIsHidden_WhenFavouriteStatusIsFalse() {
        // Given
        // Delivery isFav is false by default
        
        // When
        deliveryFeeView.updateView(delivery: delivery)
        
        // Then
        XCTAssertTrue(deliveryFeeView.isTopRightImageViewHidden, "The topRightImageView should be hidden when is fav is false.")
    }
    
    override func tearDown() {
        delivery = nil
        deliveryFeeView = nil
        super.tearDown()
    }
}
