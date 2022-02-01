//
//  ContentView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var networkManager = NetworkManager()
    @StateObject var favorites = Favorites()
    
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Group {
                if networkManager.isLoading {
                    LoadingView()
                } else if networkManager.errorMessage != nil {
                    ErrorView(networkManager: networkManager)
                } else {
                    CatListView(cats: networkManager.cats)
                }
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("Breeds")
            }
            
            CatFavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
                
            
        }
        .environmentObject(favorites)
        .accentColor(.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
