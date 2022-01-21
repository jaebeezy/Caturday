//
//  CatListView.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/11/22.
//

import SwiftUI

struct CatListView: View {
    
    @State private var searchText: String = ""
    let networkManager = NetworkManager()
    
    let cats: [Cat]
    var filteredCats: [Cat] {
        if searchText.count == 0 {
            return cats
        } else {
            return cats.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCats) { cat in
                    NavigationLink {
                        CatDetailView(cat: cat)
                    } label: {
                        CatRowView(cat: cat)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Caturday")
            .searchable(text: $searchText)
        }
        .refreshable {
            networkManager.fetchCatBreeds()
        }
        
    }
}

struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView(cats: NetworkManager.successState().cats)
    }
}
