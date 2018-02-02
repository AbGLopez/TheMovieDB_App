//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 7/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType)
}
