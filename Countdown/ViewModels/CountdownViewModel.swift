//
//  CountdownViewModel.swift
//  Countdown
//
//  Created by Alex de la Rosa on 7/5/23.
//

import Foundation
import Combine

class CountdownViewModel: ObservableObject {
    @Published var date: Date = Date().addingTimeInterval(60 * 60 * 24)
    @Published var days = 0
    @Published var hours = 0
    @Published var minutes = 0
    @Published var seconds = 0
    
    var timer = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .common).autoconnect()
    
    deinit {
        timer.upstream.connect().cancel()
    }
    
    func calculateDifference() {
        let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: date)
        
        days = components.day!
        hours = components.hour!
        minutes = components.minute!
        seconds = components.second!
    }
}
