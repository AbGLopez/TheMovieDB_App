//
//  FeaturePresenterTest.swift
//  TMDbCoreTests
//
//  Created by Abraham Gonzalez Lopez on 8/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import XCTest
@testable import TMDbCore

// Test de DidSelectShow y DidSelectMovie
class FeaturePresenterTest: XCTestCase {
    // Declaración de lo que se testea
    var sut: FeaturedPresenter!
    
    // Collaborators
    var detailNavigatorMock   : DetailNavigatorMock!
    var featureRepositoryMock : FeaturedRepositoryMock!
    
    override func setUp() {
        super.setUp()
        // Se crean los colaboradores
        detailNavigatorMock = DetailNavigatorMock()
        featureRepositoryMock = FeaturedRepositoryMock()
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock,
                                repository: featureRepositoryMock)
    }
    
    // Caso de test - Given, When, Then
    // Se testea que cuando se selecciona un Show/Movie se navega
    func testFeaturedPresenter_didSelectedShow_navigatesToShow() {
        // Given -
        let show = Show(identifier: 42,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        firstAirDate: nil,
                        genreIdentifiers: nil)
        
        // When  -
        sut.didSelect(show: show)
        
        // Then -
        // Al hacer la llamada ha ido 0K
        XCTAssertTrue(detailNavigatorMock.showDetailCalled)
        
        let (identifier, mediaType) = detailNavigatorMock.showDetailParameters!
        XCTAssertEqual(42, identifier)
        XCTAssertEqual(.show, mediaType)
    }
    
    // Se testea que cuando se llama DidLoad se cargan contenidos (requiere Mock de vista)
    
}
