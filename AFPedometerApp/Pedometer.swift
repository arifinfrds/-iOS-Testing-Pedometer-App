//
//  Pedometer.swift
//  AFPedometerApp
//
//  Created by Arifin Firdaus on 20/10/20.
//

import Foundation

protocol Pedometer {
    var isPedometerAvaialable: Bool { get }
    func start()
}
