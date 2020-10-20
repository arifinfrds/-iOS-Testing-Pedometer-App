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
    var isPemissionDeclined: Bool = false
    
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
    
    func test_PedometerViewModel_ShouldNotStarted_WhenPedometerIsNotAvailable() {
        // given
        let pedometer = MockPedometer()
        pedometer.isPedometerAvaialable = false
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        // when
        viewModel.startPedometer()
        
        // then
        XCTAssertEqual(viewModel.appState, .notStarted)
    }
    
    func test_PedometerViewModel_WhenUserDeniedPermission_ShouldReturnNotstartedState() {
        // given
        let pedometer = MockPedometer()
        pedometer.isPemissionDeclined = true
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        // when
        viewModel.startPedometer()
        
        // then
        XCTAssertEqual(viewModel.appState, .notStarted)
    }
    
    func test_PedometerViewModel_WhenUserAllowPermission_ShouldReturnInProgressState() {
        // given
        let pedometer = MockPedometer()
        pedometer.isPemissionDeclined = false
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        // when
        viewModel.startPedometer()
        
        // then
        XCTAssertEqual(viewModel.appState, .inProgress)
    }

}
