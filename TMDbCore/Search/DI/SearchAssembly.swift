//
//  SearchAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class SearchAssembly {
    // Inyectamos las dependencias
    private let imageLoadingAssembly: ImageLoadingAssembly
    private let detailAssembly: DetailAssembly
    private let webServiceAssembly: WebServiceAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly,
         detailAssembly:       DetailAssembly,
         webServiceAssembly:   WebServiceAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
        self.webServiceAssembly = webServiceAssembly
    }
    
    // Instanciamos el SearchNavigator
    func searchNavigator() -> SearchNavigator {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
    func presenter() -> SearchResultsPresenter {
        return SearchResultsPresenter(detailNavigator: detailAssembly.detailNavigator(),
                                      repository: searchResultsRepository())
    }
    
    func resultPresenter() -> SearchResultPresenter {
        return SearchResultPresenter(imageRepository: imageLoadingAssembly.imageRepository,
                                     dateFormatter: webServiceAssembly.dateFormatter)
    }
    
    func searchResultsRepository() -> SearchResultsRepositoryProtocol {
        return SearchResultsRepository(webService: webServiceAssembly.webService)
    }
}

// Extension para implementar SearchResultsViewControllerProvider para crear instancias
extension SearchAssembly: SearchResultsViewControllerProvider {
    func searchResultsViewController() -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(),
                                           resultPresenter: resultPresenter())
    }
    
}
