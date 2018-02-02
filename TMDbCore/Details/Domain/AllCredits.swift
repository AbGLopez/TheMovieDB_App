//
//  CombinedCredits.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 18/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

// Struct necesario para recoger los objetos en los que ha participado la persona
struct AllCredits: Decodable {
    struct Credit : Decodable {
        let name         : String?
        let identifier   : Int64
        let title        : String?
        let overview     : String?
        let posterPath   : String?
        let mediaType    : String
        
        
        private enum CodingKeys: String, CodingKey {
            case name
            case identifier = "id"
            case title
            case overview
            case posterPath = "poster_path"
            case mediaType  = "media_type"
        }
    }
    let cast: [Credit]
}
