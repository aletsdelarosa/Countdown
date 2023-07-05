//
//  Countdown.swift
//  Countdown
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct Countdown: View {
    @ObservedObject var viewModel: CountdownViewModel
    
    var body: some View {
        VStack {
            CountdownItem(value: viewModel.days, type: .days)
            CountdownItem(value: viewModel.hours, type: .hours)
            CountdownItem(value: viewModel.minutes, type: .minutes)
            CountdownItem(value: viewModel.seconds, type: .seconds)
        }
        .onReceive(viewModel.timer) { _ in
            viewModel.calculateDifference()
        }
    }
}

fileprivate struct CountdownItem: View {
    enum ItemType: String {
        case days
        case hours
        case minutes
        case seconds
        
        var title: String  {
            self.rawValue.capitalized
        }
    }
    
    let value: Int
    let type: ItemType
    
    var body: some View {
        VStack {
            Text(String(value))
            Text(type.title)
                .fontWeight(.bold)
        }
        .padding()
    }
}

struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
        Countdown(viewModel: CountdownViewModel())
    }
}
