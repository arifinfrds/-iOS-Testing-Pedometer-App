//
//  MockPedometer.swift
//  AFPedometerAppTests
//
//  Created by Arifin Firdaus on 21/10/20.
//

import Foundation
import CoreMotion
@testable import AFPedometerApp


class MockPedometer: Pedometer {
    
    var isPedometerAvaialable: Bool = true
    var isPemissionDeclined: Bool = false
    
    var isStarted = false
    
    var error: Error?
    
    var updateBlock: ((CMPedometerEvent?, Error?) -> Void)?
    var dataBlock: ((PedometerData?, Error?) -> Void)?
        
    static let noAuthorizationError = NSError(
        domain: CMErrorDomain,
        code: Int(CMErrorMotionActivityNotAuthorized.rawValue),
        userInfo: nil
    )
    
    func sendData(_ data: MockPedometerData) {
        self.dataBlock?(data, error)
    }
    
    func start(updatesCompletion: @escaping (PedometerData?, Error?) -> Void, eventUpdatesCompletion: @escaping (CMPedometerEvent?, Error?) -> Void) {
        self.isStarted = true
        self.updateBlock = eventUpdatesCompletion
        self.dataBlock = updatesCompletion
        
        DispatchQueue.global(qos: .default).async {
            self.updateBlock?(nil, self.error)
        }
    }
    
}
