//
//  PedometerViewModel.swift
//  AFPedometerApp
//
//  Created by Arifin Firdaus on 20/10/20.
//

import Foundation
import CoreMotion

enum AppState {
    case notStarted
    case inProgress
    case notAuthorized
}

class PedometerViewModel {
    private let pedometer: Pedometer
    var appState: AppState = .notStarted
    
    init(pedometer: Pedometer) {
        self.pedometer = pedometer
    }
    
    func startPedometer() {
        if !pedometer.isPedometerAvaialable {
            self.appState = .notStarted
            return
        }
        
        if pedometer.isPemissionDeclined {
            self.appState = .notStarted
            return
        }
        
        appState = .inProgress
        self.pedometer.start { error in
            if let error = error {
                let nsError = error as NSError
                if nsError.domain == CMErrorDomain
                    && nsError.code == CMErrorMotionActivityNotAuthorized.rawValue {
                    self.appState = .notAuthorized
                }
            }
        }
        
    }
}
