//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 7/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PhoneDetailNavigator : DetailNavigator {
    
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    // Se inyecta por contructor
    init(navigationController: UINavigationController,
         viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController   = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    // Navegacion a Detail view
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType) {
        let viewController = viewControllerProvider.detailViewController(identifier: identifier,
                                                                         mediaType : mediaType)
        navigationController.pushViewController(viewController, animated: true)
    }
}
