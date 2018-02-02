//
//  DetailInfo+ShowDetail.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 12/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailInfo {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title         = show.title
        posterPath    = show.posterPath
        backdropPath  = show.backdropPath
        
        let releaseDate = show.releaseDate.flatMap { dateFormatter.date(from: $0)}
        let year = (releaseDate?.year).map { String($0) }
        let numberSeason = "\(show.numberSeason) seasons."

        metadata = [year, numberSeason].flatMap { $0 }.joined(separator: " - ")
    }
}
