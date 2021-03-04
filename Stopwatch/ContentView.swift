//
//  ContentView.swift
//  Stopwatch
//
//  Created by Roma Marshall on 04.03.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        VStack {
            Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                .font(.largeTitle)
                .padding(.bottom, 64)
            
            if (stopWatchManager.mode == .stopped || stopWatchManager.mode == .paused )  {
                Button(action: {self.stopWatchManager.start()}, label: {
                    Text("Start")
                })
                .font(.title2)
                .frame(width: 130, height: 30)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom)
            }
            
            if stopWatchManager.mode == .running {
                Button(action: {self.stopWatchManager.pause()}, label: {
                    Text("Pause")
                })
                .font(.title2)
                .frame(width: 130, height: 30)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom)
            }
            
            Button(action: {self.stopWatchManager.stop()}, label: {
                Text("Stop")
            })
            .font(.title2)
            .frame(width: 130, height: 30)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
