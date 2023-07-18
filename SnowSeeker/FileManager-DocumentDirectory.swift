//
//  FileManager-DocumentDirectory.swift
//  BucketList
//
//  Created by Nicolò Perino on 15.07.23.
//

import Foundation

extension FileManager {
    static let docPath = FileManager.documentDirectory

    
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
        
    static func loadData<T: Decodable>(from pathComponent: String) -> Set<T> {
        if let data = try? Data(contentsOf: FileManager.docPath.appendingPathComponent(pathComponent)) {
            if let decoded = try? JSONDecoder().decode(Set<T>.self, from: data) {
                return decoded
            }
        }
        return Set<T>()
    }
    
    static func saveData<T: Encodable>(contentOf content: Set<T>, to pathComponent: String) {
        if let data = try? JSONEncoder().encode(content) {
            try? data.write(to: FileManager.docPath.appendingPathComponent(pathComponent), options: [.atomic, .completeFileProtection])
        }
    }
    
}
