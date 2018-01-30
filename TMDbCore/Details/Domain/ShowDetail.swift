//
//  ShowDetail.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 12/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let backdropPath   : String?
    let identifier     : Int64
    let overview       : String?
    let posterPath     : String?
    let releaseDate    : String?
    let numberSeason   : Int
    let title          : String
    let credits        : Credits?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath  = "backdrop_path"
        case identifier    = "id"
        case overview
        case posterPath    = "poster_path"
        case releaseDate   = "first_air_date"
        case numberSeason  = "number_of_seasons"
        case title         = "name"
        case credits
    }
}
