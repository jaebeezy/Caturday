//
//  HomeView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import SwiftUI

struct HomeView: View {
    
    
    let fact: String
    
    var body: some View {
        NavigationView {
            TileView(fact: fact)
                .navigationTitle("Home")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(fact: "A cat is a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline. Yes a feline.")
    }
}
