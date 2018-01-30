//
//  SearchNavigator.swift
//  TMDbCore
//
//  Created by Abraham Gonzalez Lopez on 7/01/18.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

// Al igual que el detail navigation lo implementamos como un
// protocolo de SearchNavigator que encapsule a searchNavigator

protocol SearchNavigator {
    func installSearch(viewController: UIViewController)
}
