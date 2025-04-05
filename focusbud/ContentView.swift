//
//  ContentView.swift
//  focusbud
//
//  Created by Alexandre Martins on 05/04/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var focusTimer = FocusTimer(startTime: 1 * 60)

    var body: some View {
        VStack(spacing: 30) {
            Text(timeFormatted())
                .font(.system(size: 60, weight: .bold, design: .monospaced))

            HStack(spacing: 20) {
                Button("Start") {
                    focusTimer.start()
                }
                .buttonStyle(color: .green)

                Button("Pause") {
                    focusTimer.pause()
                }
                .buttonStyle(color: .orange)

                Button("Reset") {
                    focusTimer.reset(startTime: 1 * 60)
                }
                .buttonStyle(color: .red)
            }
        }
        .padding()
    }

    func timeFormatted() -> String {
        let minutes = focusTimer.timeRemaining / 60
        let seconds = focusTimer.timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    ContentView()
}

// Custom button style to clean up the view
extension Button {
    func buttonStyle(color: Color) -> some View {
        self
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
            .buttonStyle(PlainButtonStyle())
    }
}
