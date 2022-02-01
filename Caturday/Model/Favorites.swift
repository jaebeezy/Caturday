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
    
    /// MARK: need to implement save functionality for local devices
    /// probably use UserDefaults to save and load favorites so they're not reset each time
    /// the app is opened and closed
    
    func save() {
        
    }
}
