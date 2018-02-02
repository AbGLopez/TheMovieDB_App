//
//  PersonRepository.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 14/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol PersonRepositoryProtocol {
    func person(withIdentifier identifier: Int64) -> Observable<PersonInfo>
}

final class PersonRepository: PersonRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func person(withIdentifier identifier: Int64) -> Observable<PersonInfo> {
        return webService.load(PersonInfo.self, from: .person(identifier: identifier))
    }
}
