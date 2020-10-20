//
//  AFPedometerAppTests.swift
//  AFPedometerAppTests
//
//  Created by Arifin Firdaus on 19/10/20.
//

import XCTest
@testable import AFPedometerApp
import CoreMotion


protocol Pedometer {
    var isPedometerAvaialable: Bool { get }
    func start()
}

extension CMPedometer: Pedometer {
    
    var isPedometerAvaialable: Bool {
        return CMPedometer.isStepCountingAvailable()
            && CMPedometer.isDistanceAvailable()
            && CMPedometer.authorizationStatus() != .restricted
    }
    
    func start() {
        
    }
}

class MockPedometer: Pedometer {
    var isPedometerAvaialable: Bool = true
    
    var isStarted = false
    
    func start() {
        isStarted = true
    }
}

enum AppState {
    case notStarted
    case inProgress
}

class PedometerViewModel {
    private let pedometer: Pedometer
    var appState: AppState = .notStarted
    
    init(pedometer: Pedometer) {
        self.pedometer = pedometer
    }
    
    func startPedometer() {
        if !pedometer.isPedometerAvaialable {
            self.appState = .notStarted
            return
        }
        pedometer.start()
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
