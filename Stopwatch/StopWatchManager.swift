//
//  StopWatchManager.swift
//  Stopwatch
//
//  Created by Roma Marshall on 04.03.21.
//

import Foundation
import SwiftUI

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class StopWatchManager: ObservableObject {
    @Published var secondsElapsed = 0.0
    @Published var mode: stopWatchMode = .stopped
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            return self.secondsElapsed += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
}

