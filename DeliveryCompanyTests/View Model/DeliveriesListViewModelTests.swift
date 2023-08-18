//
//  DeliveriesListViewModelTests.swift
//  DeliveryCompanyTests
//
//  Created by Hammad Qayyum on 18/08/2023.
//

import XCTest
@testable import DeliveryCompany

final class DeliveriesListViewModelTests: XCTestCase {
    var sut: DeliveriesListViewModel!
    var mockWebservice: MockWebService!
    
    override func setUp() {
        super.setUp()
        mockWebservice = MockWebService()
        sut = DeliveriesListViewModel(webservice: mockWebservice)
    }
    
    
    func test_FetchDeliveriesSuccess() {
        // Given
        mockWebservice.shouldReturnError = false
        
        let expectation = self.expectation(description: "Fetching deliveries")
        
        let notificationName = Notification.Name.deliveriesFetched
        let observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: nil) { _ in
            expectation.fulfill()
        }
        
        // When
        sut.fetchDeliveries(readFromLocalStorage: false)
        
        // Wait for the expectation here Realm write is async so that why we needed to wait else it was failing
        wait(for: [expectation], timeout: 5.0)
        
        // Then
        XCTAssertGreaterThan(sut.deliveriesCount(), 0, "Deliveries count > 0 when fetched from mock service")

       // XCTAssertEqual(sut.deliveriesCount(), 1, "Deliveries count should be 1 after a successful fetch")
        
        // Cleanup
        NotificationCenter.default.removeObserver(observer)
    }
    
    func test_FetchDeliveriesFailure() {
        // Given
        mockWebservice.shouldReturnError = true
        
        // When
        sut.fetchDeliveries(readFromLocalStorage: false)
        
        // Then
        XCTAssertEqual(sut.deliveriesCount(), 0)
    }
    
    func test_FetchDeliveriesWithLocalStorage() {
        // Given
        mockWebservice.shouldReturnError = true
        
        let expectation = self.expectation(description: "Fetching deliveries")
        
        let notificationName = Notification.Name.deliveriesFetched
        let observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: nil) { _ in
            expectation.fulfill()
        }
        
        // When
        sut.fetchDeliveries(readFromLocalStorage: true)
        
        // Then
        // Wait for the expectation here Realm read is async so that why we needed to wait else it was failing
        wait(for: [expectation], timeout: 5.0)
        
        // Then
        XCTAssertGreaterThan(sut.deliveriesCount(), 0, "Deliveries count > 0 when read from realm")

        // Cleanup
        NotificationCenter.default.removeObserver(observer)
    }
    
    
    func test_Pagination_MoreItemsThanPageSize() {
         // Given
         mockWebservice.shouldReturnError = false
         mockWebservice.numberOfItemsToReturn = sut.getPageSize() + 1
        
        let expectation = self.expectation(description: "Fetching deliveries")
        
        let notificationName = Notification.Name.deliveriesFetched
        let observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: nil) { _ in
            expectation.fulfill()
        }
         
         // When
         sut.fetchDeliveries(readFromLocalStorage: false)
        
        // Then
        wait(for: [expectation], timeout: 5.0)
        
         
         // Then
         XCTAssertTrue(sut.isPaginationNeeded, "isPaginationNeeded should be true when deliveries fetched > page size")
        
        NotificationCenter.default.removeObserver(observer)
     }
    
    func test_Pagination_LessItemsThanPageSize() {
        // Given
        mockWebservice.shouldReturnError = false
        mockWebservice.numberOfItemsToReturn = sut.getPageSize() - 1
        
        let expectation = self.expectation(description: "Fetching deliveries")
        
        let notificationName = Notification.Name.deliveriesFetched
        let observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: nil) { _ in
            expectation.fulfill()
        }
         
         // When
         sut.fetchDeliveries(readFromLocalStorage: false)
        
        // Then
        // Wait for the expectation here
        wait(for: [expectation], timeout: 5.0)
        
         
        
        // Then
        XCTAssertFalse(sut.isPaginationNeeded, "isPaginationNeeded should be false when deliveries are less than page size")
        NotificationCenter.default.removeObserver(observer)
    }
    
    
    override func tearDown() {
        sut = nil
        mockWebservice = nil
        super.tearDown()
    }

}

