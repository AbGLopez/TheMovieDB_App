//
//  AppAssembly.swift
//  TMDb
//
//  Created by Abraham Gonzalez Lopez on 6/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit
import TMDbCore

final class AppAssembly {
    // Pasamos medidas de la pantalla
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    
    private(set) lazy var navigationController = UINavigationController()
    
    // Instanciamos CoreAssembly y conectamos con el constructor 
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
}
