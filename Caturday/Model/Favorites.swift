//
//  Favorites.swift
//  Caturday
//
//  Created by Jae Young Choi on 1/31/22.
//

import Foundation

class Favorites: ObservableObject {
    
    // private to make sure other views are messing with this logic
    // also using set because unique items (cat.id) and faster
    private var cats: Set<String>
    
    private var setKey = "favorites"
    
    init() {
        // load from device
        if let savedItems = UserDefaults.standard.data(forKey: setKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: savedItems) {
                cats = decoded
                return
            }
        }
        
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
        if let encoded = try? JSONEncoder().encode(cats) {
            UserDefaults.standard.set(encoded, forKey: setKey)
        }
    }
}
