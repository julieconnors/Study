//
//  Episode.swift
//  NavAndFav
//
//  Created by Julie Connors on 8/24/21.
//

import Foundation

struct Episode: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name, image, summary, season
    }
    
    let name: String
    let image: EpisodeImage
    var summary: String
    let season: Int
    
    var isFavorite: Bool = false
}

struct EpisodeImage: Decodable {
    let medium: String
}

