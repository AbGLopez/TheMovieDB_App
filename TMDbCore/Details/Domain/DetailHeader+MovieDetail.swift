//
//  DetailHeader+MovieDetail.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 12/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(movie: MovieDetail, dateFormatter: DateFormatter) {
        title = movie.title
        posterPath = movie.posterPath
        backdropPath = movie.backdropPath
        
        let releaseDate = movie.releaseDate.flatMap { dateFormatter.date(from: $0)}
        let year = (releaseDate?.year).map { String($0) }
        let duration = "\(movie.runtime) min."
        
        metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
    }
}
