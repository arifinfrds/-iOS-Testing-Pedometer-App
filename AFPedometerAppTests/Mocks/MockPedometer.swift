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
    
    static let noAuthorizationError = NSError(
        domain: CMErrorDomain,
        code: Int(CMErrorMotionActivityNotAuthorized.rawValue),
        userInfo: nil
    )
    
    // static var notAthorizedError = NS
    
    func start(completion: @escaping (Error?) -> Void) {
        self.isStarted = true
        
        DispatchQueue.global(qos: .default).async {
            completion(self.error)
        }
    }
}
