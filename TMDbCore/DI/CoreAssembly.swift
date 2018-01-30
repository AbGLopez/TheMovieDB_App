//
//  CoreAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 22/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final public class CoreAssembly {
    // Se añade NavigationController
    // Se añade DetailAssembly
    private(set) lazy var detailAssembly = DetailAssembly(imageLoadingAssembly: imageLoadingAssembly,
                                                          navigationController: navigationController,
                                                          webServiceAssembly: webServiceAssembly)
    
    public private(set) lazy var featuredAssembly = FeaturedAssembly(imageLoadingAssembly: imageLoadingAssembly,
                                                                     detailAssembly: detailAssembly,
                                                                     searchAssembly: searchAssembly,
                                                                     webServiceAssembly: webServiceAssembly)
    
    private(set) lazy var searchAssembly = SearchAssembly(imageLoadingAssembly: imageLoadingAssembly,
                                                          detailAssembly: detailAssembly,
                                                          webServiceAssembly: webServiceAssembly)
    
    private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
    
	private(set) lazy var webServiceAssembly = WebServiceAssembly()
    
    // Se añade propiedad navigationController
    private let navigationController: UINavigationController

    // Se pasa por parametros el navigationController
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
