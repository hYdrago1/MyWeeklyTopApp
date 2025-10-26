//
//  Network.swift
//  MyWeeklyTopApp
//
//  Created by Ivan Honcharov on 26.10.25.
//

import Foundation

final class MovieService {
    private let apiKey = "6da1e76cd69f826bfe1f4a8015f066cc"
    private let baseURL = "https://api.themoviedb.org/3"
    
    func fetchTrendingMovies() async throws -> [Movie] {
        let urlString = "\(baseURL)/trending/movie/week?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MoviesResponse.self, from: data)
        return response.results
    }
}
