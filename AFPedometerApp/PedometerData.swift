//
//  PedometerData.swift
//  AFPedometerApp
//
//  Created by Arifin Firdaus on 21/10/20.
//

import Foundation

protocol PedometerData {
    var steps: Int { get }
    var distanceTravelled: Double { get }
}
