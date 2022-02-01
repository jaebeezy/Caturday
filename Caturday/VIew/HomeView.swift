//
//  HomeView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var date = Date()
    let fact: String
    
    // formating time to add seconds
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        return formatter
    }
    
    // transform date obj to string
    func timeString(_ date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    // function to live update timer
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.date = Date()
        }
    }
    
    /// MARK:
    /// need to animate the home page UI
    /// i want an animated time and date
    /// and then adding like a random cat fact. and maybe pressing a button to fetch a new cat fact.
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Today is")
                    Text(date, style: .date)
                }
                
                VStack {
                    Text("The current time is")
                    Text(timeString(date))
                        .onAppear {
                            let _ = self.updateTimer
                        }
                }
                                
                Text("And it is Caturday")
                
                Divider()
                
                Text(fact)
            }
            .navigationTitle("Welcome")
        }
        
    }
}

