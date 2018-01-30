//
//  PosterStripItem+CastMember.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 12/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(castMember: Credits.CastMember) {
        identifier = castMember.identifier
        mediaType  = .person
        title      = castMember.name
        metadata   = castMember.character
        posterPath = castMember.profilePath
    }
}
