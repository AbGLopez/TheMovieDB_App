//
//  PhoneSearchNavigator.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 7/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PhoneSearchNavigator: SearchNavigator {
    
    // Se crea el viewControllerProvider
    private unowned let viewControllerProvider: SearchResultsViewControllerProvider
    
    // Se crea una variable para almacenar la instancia UISearchController
    private var searchController: UISearchController!
    
    // Constructor
    init(viewControllerProvider: SearchResultsViewControllerProvider) {
        self.viewControllerProvider = viewControllerProvider
    }
    
    func installSearch(viewController: UIViewController) {
        // Se crea el ViewController para mostrar los resultados de la busqueda
        let resultsViewController = viewControllerProvider.searchResultsViewController()
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        
        searchController.searchResultsUpdater = resultsViewController
        
        // No se quiere esconder la NavController
        searchController.hidesNavigationBarDuringPresentation = false
        
        // se le indica que ponga de fondo la palabra "Search"
        searchController.searchBar.placeholder = NSLocalizedString("Search",
                                                                   comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        
        // Se infica que el viewcontroller esté sólo dentro del contexto sino ocuparia toda la pantalla tapando el resto de objetos
        viewController.definesPresentationContext = true
    }
}
