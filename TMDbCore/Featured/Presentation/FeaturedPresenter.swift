//
//  FeaturedPresenter.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol FeaturedView: class {
    
    // Propiedad para configurar el titulo
    var title : String? { get set }
    
    // Metodos de protocolo para configurar la pantalla
    func setShowsHeaderTitle(_ title: String)
	func setMoviesHeaderTitle(_ title: String)

	func update(with shows: [Show])
	func update(with movies: [Movie])
}

final class FeaturedPresenter {
    // Se crea una dependencia a Detail para poder navegar
    private let detailNavigator : DetailNavigator
    private let repository      : FeaturedRepositoryProtocol
    private let disposeBag      = DisposeBag()
    
    weak var view: FeaturedView?

    // Inyectamos la dependencia por constructor
    init(detailNavigator: DetailNavigator,
         repository: FeaturedRepositoryProtocol) {
        self.detailNavigator  = detailNavigator
        self.repository       = repository
    }
    
	func didLoad() {
        // Sections
        view?.title = NSLocalizedString("HOME", comment: "")
		view?.setShowsHeaderTitle(NSLocalizedString("ON TV", comment: ""))
		view?.setMoviesHeaderTitle(NSLocalizedString("ON CINEMA", comment: ""))

		loadContents()
	}

	func didSelect(show: Show) {
        detailNavigator.showDetail(withIdentifier: show.identifier,
                                   mediaType: .show)
	}

	func didSelect(movie: Movie) {
        detailNavigator.showDetail(withIdentifier: movie.identifier,
                                   mediaType: .movie)
    }
}

private extension FeaturedPresenter {
    func loadContents() {
        let showsOnTheAir = repository.showsOnTheAir()
            .map { $0.prefix(3) }
        
        let moviesNowPlaying = repository.moviesNowPlaying(region: Locale.current.regionCode!)
            .map { $0.prefix(3) }
        
        Observable.combineLatest(showsOnTheAir, moviesNowPlaying) { shows, movies in
            return (shows, movies)
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] shows, movies in
                guard let `self` = self else {
                    return
                }
                self.view?.update(with: Array(shows))
                self.view?.update(with: Array(movies))
            })
            .disposed(by: disposeBag)
    }
}
