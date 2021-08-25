//
//  DiskManager.swift
//  UserDefaultsPractice
//
//  Created by Julie Connors on 8/25/21.
//

import Foundation

struct DiskStorage {
    static func saveInput(withKey key: String, value: String, using fileManager: FileManager = .default) throws {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
                
        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else { return }
    
        print("FILE URL: \(fileURL)")
        
        let data = try JSONEncoder().encode(value)
        try data.write(to: fileURL)
    }
    
    static func readInput<T: Decodable>(fromKey key: String, using fileManager: FileManager = .default) throws -> T {
        
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = fileManager.urls(for: cacheDirectory, in: .userDomainMask)
        
        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else { fatalError() }
                
        guard let data = fileManager.contents(atPath: fileURL.path) else { fatalError() }
        
        let lastInput = try JSONDecoder().decode(T.self, from: data)
        return lastInput
    }
}
