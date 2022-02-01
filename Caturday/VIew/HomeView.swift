//
//  HomeView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import SwiftUI

struct HomeView: View {
    
    let date = Date()
    let fact: String
    
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
                    Text(date, style: .time)
                }
                
                Text("And it is Caturday")
                
                Text(fact)
            }
            .navigationTitle("Welcome")
        }
        
    }
}

