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
    
    func start(updatesCompletion: @escaping (PedometerData?, Error?) -> Void, eventUpdatesCompletion: @escaping (CMPedometerEvent?, Error?) -> Void) {
        startUpdates(from: Date()) { (pedometerData, error) in
            updatesCompletion(pedometerData, error)
        }
        startEventUpdates { (event, error) in
            eventUpdatesCompletion(event, error)
        }
    }
}

