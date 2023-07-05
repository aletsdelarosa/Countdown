//
//  ContentView.swift
//  Countdown
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CountdownViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Select a Date", selection: $viewModel.date)
                    .padding()
                
                Spacer()
                
                Countdown(viewModel: viewModel)
                
                Spacer()
                
            }
            .navigationTitle("Countdown")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
