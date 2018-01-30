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
    // Propiedad de la ventana con las medidas de la pantalla
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    
    // NavigationController para poder realizar la navegación por la aplicación
    private(set) lazy var navigationController = UINavigationController()
    
    // Se instancia el CoreAssembly y se añade el pasa al constructor el NavigationController
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
}
