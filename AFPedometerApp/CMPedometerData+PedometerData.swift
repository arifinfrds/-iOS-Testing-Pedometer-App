//
//  CMPedometerData+PedometerData.swift
//  AFPedometerApp
//
//  Created by Arifin Firdaus on 21/10/20.
//

import Foundation
import CoreMotion

extension CMPedometerData: PedometerData {
    var steps: Int {
        return self.numberOfSteps.intValue
    }
    
    var distanceTravelled: Double {
        return self.distance?.doubleValue ?? 0
    }
}

