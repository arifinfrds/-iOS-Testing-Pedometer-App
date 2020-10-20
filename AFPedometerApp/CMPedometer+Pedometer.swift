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
    
    func start() {
        
    }
}
