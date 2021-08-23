//
//  Show.swift
//  singletonPractice
//
//  Created by Julie Connors on 8/23/21.
//

import Foundation

struct Shows: Decodable {
    let name: String
    var image: ShowImage
}
   
struct ShowImage: Decodable {
    let medium: String
    let original: String
}
