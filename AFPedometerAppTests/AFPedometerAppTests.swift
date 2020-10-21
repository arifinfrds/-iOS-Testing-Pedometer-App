//
//  AFPedometerAppTests.swift
//  AFPedometerAppTests
//
//  Created by Arifin Firdaus on 19/10/20.
//

import XCTest
@testable import AFPedometerApp
import CoreMotion

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
        pedometer.isPedometerAvaialable = false // stubbing
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        // when
        viewModel.startPedometer()
        
        // then
        XCTAssertEqual(viewModel.appState, .notStarted)
    }
    
    func test_PedometerViewModel_WhenUserDeniedPermission_ShouldReturnNotstartedState() {
        // given
        let pedometer = MockPedometer()
        pedometer.isPemissionDeclined = true // stubbing
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        // when
        viewModel.startPedometer()
        
        // then
        XCTAssertEqual(viewModel.appState, .notStarted)
    }
    
    func test_PedometerViewModel_WhenUserIsNotAllowPermission_ShouldReturnUnaothorized() {
        // given
        let pedometer = MockPedometer()
        pedometer.error = MockPedometer.noAuthorizationError // stubbing
        let viewModel = PedometerViewModel(pedometer: pedometer)
        
        let predicate = NSPredicate { (object, _) -> Bool in
            let vm = object as! PedometerViewModel
            return vm.appState == .notAuthorized
        }
        let expectation = self.expectation(for: predicate, evaluatedWith: viewModel, handler: nil)
        
        // when
        viewModel.startPedometer()
        wait(for: [expectation], timeout: 2.0)
        
        // then
        XCTAssertEqual(viewModel.appState, .notAuthorized)
    }

}
