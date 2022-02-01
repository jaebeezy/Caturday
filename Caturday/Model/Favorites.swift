//
//  Favorites.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import Foundation

class Favorites: ObservableObject {
    
    private var cats: Set<String>
    
    private var setKey = "favorites"
    
    init() {
        cats = []
    }
    
    func isEmpty() -> Bool {
        return cats.isEmpty
    }
    
    func contains(_ cat: Cat) -> Bool {
        return cats.contains(cat.id)
    }
    
    func add(_ cat: Cat) {
        objectWillChange.send()
        cats.insert(cat.id)
        save()
    }

    func remove(_ cat: Cat) {
        objectWillChange.send()
        cats.remove(cat.id)
        save()
    }
    
    func save() {
        
    }
}
