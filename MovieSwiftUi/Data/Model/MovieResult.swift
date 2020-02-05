//
//  MovieResult.swift
//  MovieSwiftUi
//
//  Created by Unknown on 05/02/20.
//  Copyright © 2020 AsiaQuest Indonesia. All rights reserved.
//

import Foundation

struct MovieResult: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
