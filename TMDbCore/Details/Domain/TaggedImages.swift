//
//  TaggedImages.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 18/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

// Se crea un struct para poder obtener las imagenes del servidor
struct TaggedImages: Decodable {
    let posterPath: String?
    let mediaType: String
    
    private enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case posterPath = "file_path"
    }
}
