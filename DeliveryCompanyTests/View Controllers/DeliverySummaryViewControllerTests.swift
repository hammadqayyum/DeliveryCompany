//
//  DeliverySummaryViewControllerTests.swift
//  DeliveryCompanyTests
//
//  Created by Hammad Qayyum on 18/08/2023.
//

import XCTest
@testable import DeliveryCompany
import RealmSwift

final class DeliverySummaryViewControllerTests: XCTestCase {
    private var deliverySummaryViewController: DeliverySummaryViewController!
    private var delivery: DeliveryDataModel!
    private var realm: Realm!

    override func setUp() {
        super.setUp()
//        let objectTypes = [DeliveryCompany.DeliveryDataModel.self]
//        let config = Realm.Configuration(objectTypes: objectTypes)
//        realm = try! Realm(configuration: config)
        
        let route = Route(start: "start", end: "end")
        let sender = Sender(phone: "1234567890", name: "HQ", email: "ha@gmail.com")
        let delivery = Delivery(id: "1", remarks: "Fragile", goodsPicture: "http://google.com", deliveryFee: "10.00", surcharge: "5.00", route: route, sender: sender)
        self.delivery = DeliveryDataModel(delivery: delivery)
        deliverySummaryViewController = DeliverySummaryViewController(delivery: self.delivery)
    }

    

    func test_FavouriteButtonTappedUpdatesFavouriteStatus() {
        let initialStatus = delivery.favouriteStatus()

        deliverySummaryViewController.favouriteButtonTapped()

        XCTAssertNotEqual(delivery.favouriteStatus(), initialStatus)
    }
/*
    func test_FavouriteStatusIsUpdatedInRealmWhenButtonIsTapped() {
        try! realm.write {
            realm.add(delivery)
        }

        let initialFavStatus = delivery.favouriteStatus()

        deliverySummaryViewController.favouriteButtonTapped()

        let updatedDelivery = realm.object(ofType: DeliveryDataModel.self, forPrimaryKey: delivery._id)

        XCTAssertNotEqual(updatedDelivery?.favouriteStatus(), initialFavStatus)
    }  */
    
    override func tearDown() {
        deliverySummaryViewController = nil
        delivery = nil
        realm = nil
        super.tearDown()
    }
}
