//
//  CMPedometer+Pedometer.swift
//  AFPedometerApp
//
//  Created by Arifin Firdaus on 20/10/20.
//

import Foundation
import CoreMotion

extension CMPedometer: Pedometer {
  
    var isPedometerAvaialable: Bool {
        return CMPedometer.isStepCountingAvailable()
            && CMPedometer.isDistanceAvailable()
            && CMPedometer.authorizationStatus() != .restricted
    }
    
    var isPemissionDeclined: Bool {
        return CMPedometer.authorizationStatus() == .denied
    }
    
    func start(completion: @escaping (Error?) -> Void) {
        startEventUpdates { (event, error) in
            if let error = error {
                completion(error)
                return
            }
        }
    }
}

