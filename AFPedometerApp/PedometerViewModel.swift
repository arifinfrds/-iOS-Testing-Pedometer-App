//
//  PedometerViewModel.swift
//  AFPedometerApp
//
//  Created by Arifin Firdaus on 20/10/20.
//

import Foundation

enum AppState {
    case notStarted
    case inProgress
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
        pedometer.start()
    }
}
