//
//  SearchResultsRepository.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 12/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol SearchResultsRepositoryProtocol {
    func searchResults(withQuery query: String, page: Int) -> Observable<[SearchResult]>
}

final class SearchResultsRepository: SearchResultsRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func searchResults(withQuery query: String, page: Int) -> Observable<[SearchResult]> {
        return webService.load(Page<SearchResult>.self, from: .searchResults(query: query, page: page))
            .map { $0.results }
    }
}
