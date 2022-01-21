//
//  ContentView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var networkManager = NetworkManager()
    
    var body: some View {
        
        if networkManager.isLoading {
            LoadingView()
        } else if networkManager.errorMessage != nil {
            ErrorView(networkManager: networkManager)
        } else {
            CatListView(cats: networkManager.cats)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
