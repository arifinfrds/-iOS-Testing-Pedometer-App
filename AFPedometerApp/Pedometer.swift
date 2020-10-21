//
//  Pedometer.swift
//  AFPedometerApp
//
//  Created by Arifin Firdaus on 20/10/20.
//

import Foundation
import CoreMotion

protocol Pedometer {
    var isPedometerAvaialable: Bool { get }
    var isPemissionDeclined: Bool { get }
    
    func start(
        updatesCompletion: @escaping (PedometerData?, Error?) -> Void,
        eventUpdatesCompletion: @escaping (CMPedometerEvent?, Error?) -> Void
    )
}
