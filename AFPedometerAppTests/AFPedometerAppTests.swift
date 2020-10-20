//
//  AFPedometerAppTests.swift
//  AFPedometerAppTests
//
//  Created by Arifin Firdaus on 19/10/20.
//

import XCTest
@testable import AFPedometerApp


class MockPedometer: Pedometer {
    var isPedometerAvaialable: Bool = true
    
    var isStarted = false
    
    func start() {
        isStarted = true
    }
}

class AFPedometerAppTests: XCTestCase {

    func test_Pedometer_ShouldStartWhenInitalized() {
        // given
        let pedometer = MockPedometer()
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        // when
        viewModel.startPedometer()
        
        // then
        XCTAssertTrue(pedometer.isStarted)
    }
    
    func test_Pedometer_ShouldNotStarted_WhenPedometerIsNotAvailable() {
        // given
        let pedometer = MockPedometer()
        pedometer.isPedometerAvaialable = false
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        // when
        viewModel.startPedometer()
        
        // then
        XCTAssertEqual(viewModel.appState, .notStarted)
    }

}
