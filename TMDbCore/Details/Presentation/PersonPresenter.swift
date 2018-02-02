//
//  PersonPresenter.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 14/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class PersonPresenter: DetailPresenter {
    private let repository    : PersonRepositoryProtocol
    private let dateFormatter : DateFormatter
    
    private let identifier    : Int64
    private let disposeBag    = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: PersonRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64) {
        self.repository    = repository
        self.dateFormatter = dateFormatter
        self.identifier    = identifier
    }
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.person(withIdentifier: identifier)
            .map { [weak self] person in
                self?.detailSections(for: person) ?? []
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
    }
    
    private func detailSections(for person: PersonInfo) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailInfo(person: person, dateFormatter: dateFormatter))
        ]
        
        if let overview = person.biography {
            detailSections.append(.about(title: "Biography", detail: overview))
        }
        
        return detailSections
    }
}

