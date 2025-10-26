//
//  Movie.swift
//  MyWeeklyTopApp
//
//  Created by Ivan Honcharov on 26.10.25.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let popularity: Double
    let voteAverage: Double
    let originalLanguage: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity
        case voteAverage = "vote_average"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
    }
}

struct MoviesResponse: Codable {
    let results: [Movie]
}
