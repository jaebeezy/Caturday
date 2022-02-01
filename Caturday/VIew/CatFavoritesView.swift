//
//  CatFavoritesView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import SwiftUI

struct CatFavoritesView: View {
    
    @EnvironmentObject var favorites: Favorites
    
    let cats: [Cat]
    var filteredCats: [Cat] {
        if favorites.isEmpty() {
            return []
        } else {
            return cats.filter {
                favorites.contains($0)
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                if favorites.isEmpty() {
                    Text("Add some cat breeds to your favorites.")
                } else {
                    List {
                        ForEach(filteredCats) { cat in
                            NavigationLink {
                                CatDetailView(cat: cat)
                            } label: {
                                CatRowView(cat: cat)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Favorites")
        }
    }
}


struct CatFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        CatFavoritesView(cats: NetworkManager.successState().cats)
    }
}
