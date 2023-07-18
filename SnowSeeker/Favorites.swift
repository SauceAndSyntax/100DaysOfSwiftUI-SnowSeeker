//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Nicolò Perino on 18.07.23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private var favoriteFile = "Favorites"
    
    init() {
        resorts = FileManager.loadData(from: favoriteFile)
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        FileManager.saveData(contentOf: resorts, to: favoriteFile)
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        FileManager.saveData(contentOf: resorts, to: favoriteFile)
    }

}
