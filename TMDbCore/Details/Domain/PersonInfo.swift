//
//  PersonInfo.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 14/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonInfo: Decodable {
    let name           : String
    let identifier     : Int64
    let posterPath     : String?
    let birthday       : String?
    let deathday       : String?
    let biography      : String?
    
    let credits        : AllCredits?
    let taggedImages   : Page<TaggedImages>?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case identifier    = "id"
        case posterPath    = "profile_path"
        case credits       = "combined_credits"
        case taggedImages  = "tagged_images"
        case birthday
        case deathday
        case biography
        
    }
}
