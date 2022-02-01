//
//  CatFavoritesView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import SwiftUI

struct CatFavoritesView: View {
    
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            List {
                Text("HI")
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Favorites")
        }
    }
}

struct CatFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        CatFavoritesView()
    }
}
