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
    func start()
}

extension CMPedometer: Pedometer {
    func start() {
        
    }
}

class MockPedometer: Pedometer {
    var isStarted = false
    
    func start() {
        isStarted = true
    }
}

class PedometerViewModel {
    private let pedometer: Pedometer
    
    init(pedometer: Pedometer) {
        self.pedometer = pedometer
    }
    
    func startPedometer() {
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

}
