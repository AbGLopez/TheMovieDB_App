//
//  Credits.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 12/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Credits: Decodable {
    struct CastMember: Decodable {
        let character    : String
        let identifier   : Int64
        let name         : String
        let profilePath  : String?
        
        private enum CodingKeys: String, CodingKey {
            case character
            case identifier   = "id"
            case name
            case profilePath  = "profile_path"
        }
    }
    
    let cast: [CastMember]
}
