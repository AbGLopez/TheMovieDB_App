//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 7/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    // Se crea un método para mostar el detalle en base a un identificador y un tipo
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType)
}
