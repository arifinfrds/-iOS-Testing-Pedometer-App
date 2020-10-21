//
//  MockPedometerData.swift
//  AFPedometerAppTests
//
//  Created by Arifin Firdaus on 21/10/20.
//

import CoreMotion
@testable import AFPedometerApp

struct MockPedometerData: PedometerData {
    var steps: Int
    var distanceTravelled: Double
}

