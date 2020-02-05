//
//  Movie.swift
//  MovieSwiftUi
//
//  Created by Unknown on 05/02/20.
//  Copyright © 2020 AsiaQuest Indonesia. All rights reserved.
//

import Foundation

struct Movie: Codable, Equatable {
    let posterPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double
    
    init(id: Int, title: String, desc: String, image: String) {
        self.id = id
        self.title = title
        self.overview = desc
        self.posterPath = image
        self.adult = false
        self.releaseDate = ""
        self.genreIds = [Int]()
        self.originalTitle = ""
        self.originalLanguage = ""
        self.backdropPath = ""
        self.popularity = 0
        self.voteCount = 0
        self.video = false
        self.voteAverage = 0
    }
    
    var releaseYear: String {
        return String(releaseDate.prefix(4))
    }
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}
