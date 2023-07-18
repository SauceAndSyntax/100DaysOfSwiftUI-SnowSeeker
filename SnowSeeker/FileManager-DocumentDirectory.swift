//
//  FileManager-DocumentDirectory.swift
//  BucketList
//
//  Created by Nicolò Perino on 15.07.23.
//

import Foundation

extension FileManager {
    static let favoritesSavedPath = FileManager.documentDirectory.appendingPathComponent("Favorites")

    
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
        
    static func loadData<T: Decodable>() -> Set<T> {
        if let data = try? Data(contentsOf: FileManager.favoritesSavedPath) {
            if let decoded = try? JSONDecoder().decode(Set<T>.self, from: data) {
                return decoded
            }
        }
        return Set<T>()
    }
    
    static func saveData<T: Encodable>(contentOf favorites: Set<T>) {
        if let data = try? JSONEncoder().encode(favorites) {
            try? data.write(to: FileManager.favoritesSavedPath, options: [.atomic, .completeFileProtection])
        }
    }

    
}
