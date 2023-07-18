//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by Nicolò Perino on 18.07.23.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError("Error to locate the \(file) in bundle.") }
        
        guard let data = try? Data(contentsOf: url) else { (fatalError("Error to load the \(file) from bundle.")) }
        
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else { fatalError("Error to decode the \(file) from bundle.") }
        
        return decoded
    }
}
