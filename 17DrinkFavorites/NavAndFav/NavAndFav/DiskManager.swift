//
//  DiskManager.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/25/21.
//

import Foundation

struct DiskStorage {
    static func saveFavoriteEpisode(withKey key: String, value: Episode, using fileManager: FileManager = .default) throws {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        
        print("\(folderURLs)")
        
//        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else {
//            throw DiskStorageError.missingFile
//        }
    
//        print("FILE URL: \(fileURL)")
        
//        let data = try JSONEncoder().encode(value)
//        try data.write(to: fileURL)
    }
    
//    static func findFavoriteEpisodes(fromKey key: String, using fileManager: FileManager = .default) throws -> Episode {
//
//        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
//        let folderURLs = fileManager.urls(for: cacheDirectory, in: .userDomainMask)
        
//        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else {
//            throw DiskStorageError.missingFile
//        }
                
//        guard let data = fileManager.contents(atPath: fileURL.path) else {
//            throw DiskStorageError.noData
//        }
        
//        let object = try JSONDecoder().decode(Episode.self, from: data)
//        return Episode
//    }
}
