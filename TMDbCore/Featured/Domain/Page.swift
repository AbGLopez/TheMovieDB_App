//
//  Page.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 7/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Page<T: Decodable>: Decodable {
    let page         : Int
    let totalPages   : Int
    let totalResults : Int
    let results      : [T]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalPages   = "total_pages"
        case totalResults = "total_results"
        case results
    }
}
