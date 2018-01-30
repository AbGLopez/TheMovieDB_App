//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 14/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

// Se crea un struct para mostrar el detalle de una persona
struct PersonDetail: Decodable {
    let name           : String
    let identifier     : Int64
    let posterPath     : String?
    let birthday       : String?
    let deathday       : String?
    let biography      : String?
    
    // Los campos de creditos e imagenes son clases especificas para contener
    // los sctruct necesarios para su adaptación
    let credits        : CombinedCredits?
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
