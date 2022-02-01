//
//  HomeView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import SwiftUI

struct HomeView: View {
    
    let date = Date()
    
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
            }
            .navigationTitle("Welcome")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
