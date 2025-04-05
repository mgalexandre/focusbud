//
//  FocusTimer.swift
//  focusbud
//
//  Created by Alexandre Martins on 05/04/2025.
//


import Foundation

class FocusTimer: ObservableObject {
    @Published var timeRemaining: Int
    @Published var isRunning = false

    private var timer: Timer?

    
    // content view vai buscar este valor como se fossem parametros...
    init(startTime: Int) {
        self.timeRemaining = startTime
    }

    
    func start() {
        guard timer == nil else { return }

        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stop()
            }
        }
    }

    func pause() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    func reset(startTime: Int) {
        pause()
        timeRemaining = startTime
    }

    private func stop() {
        pause()
    }
}
