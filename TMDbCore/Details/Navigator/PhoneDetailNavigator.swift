//
//  PhoneDetailNavigator.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 7/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PhoneDetailNavigator : DetailNavigator {
    
    // Para poder hacer la navegación se necesitan dependencias.
    // NavigationController
    private let navigationController: UINavigationController
    
    // ViewController - Para ello se necesita una dependencia de DetailViewControllerProvider para su generación
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    // Se inyecta por contructor
    init(navigationController: UINavigationController,
         viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController   = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    
    // Se procede a realizar la navegación a Detail
    func showDetail(withIdentifier identifier: Int64,
                    mediaType: MediaType) {
        
        // Se crea el viewController
        let viewController = viewControllerProvider.detailViewController(identifier: identifier,
                                                                         mediaType: mediaType)
        
        // Se invoca al View Controller dentro del Navigation Controller
        navigationController.pushViewController(viewController, animated: true)
    }
}
