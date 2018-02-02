//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 14/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailInfo {
    init(person: PersonInfo, dateFormatter: DateFormatter) {
        title        = person.name
        posterPath   = person.posterPath
        
        backdropPath = person.taggedImages != nil && person.taggedImages?.results.count != 0 ?
            person.taggedImages?.results[0].posterPath :
            person.credits?.cast.first?.posterPath
        
        // Se formatean las fechas para mostrarlas en el detalle
        let birthday = person.birthday.flatMap { dateFormatter.date(from: $0)}
        let birthdayYear = (birthday?.year).map { String($0) }
        let deathday = person.deathday.flatMap { dateFormatter.date(from: $0)}
        let deathdayYear = (deathday?.year).map { String($0) }
        metadata = [birthdayYear, deathdayYear].flatMap { $0 }.joined(separator: " - ")
    }
}
