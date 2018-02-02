//
//  MoviePresenter.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 12/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class MoviePresenter : DetailPresenter {
    private let repository     : MovieRepositoryProtocol
    private let dateFormatter  : DateFormatter
    private let detailNavigator: DetailNavigator
    
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: MovieRepositoryProtocol,
         dateFormatter       : DateFormatter,
         identifier          : Int64,
         detailNavigator     : DetailNavigator) {
        self.repository      = repository
        self.dateFormatter   = dateFormatter
        self.identifier      = identifier
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.movie(withIdentifier: identifier)
            .map { [weak self] movie in
                self?.detailSections(for: movie) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterItems) {
        detailNavigator.showDetail(withIdentifier: item.identifier, mediaType: .person)
    }
    
    private func detailSections(for movie: MovieDetails) -> [DetailSection] {
        var sectionsInfo: [DetailSection] = [.header(DetailInfo(movie: movie, dateFormatter: dateFormatter))]
        
        if let overview = movie.overview {
            sectionsInfo.append(.about(title: "Overview", detail: overview))
        }
        
        let items = movie.credits?.cast.map { PosterItems(castMember: $0) }
        
        if let items = items {
            sectionsInfo.append(.posterSections(title: "Cast", items: items))
        }
        
        return sectionsInfo
    }
}

