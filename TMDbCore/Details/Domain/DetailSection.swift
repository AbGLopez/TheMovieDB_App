//
//  DetailSection.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 30/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct DetailInfo {
	let title: String
	let metadata: String
	let posterPath: String?
	let backdropPath: String?
}

struct PosterItems {
	let identifier: Int64
	let mediaType: MediaType

	let title: String
	let metadata: String
	let posterPath: String?
}

enum DetailSection {
	case header(DetailInfo)
	case about(title: String, detail: String)
	case posterSections(title: String, items: [PosterItems])
}
