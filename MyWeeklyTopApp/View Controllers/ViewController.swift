//
//  ViewController.swift
//  MyWeeklyTopApp
//
//  Created by Ivan Honcharov on 26.10.25.
//

import UIKit

final class ViewController: UIViewController {
    private let movieService = MovieService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await loadMovie()
        }
    }
    
    private func loadMovie() async {
        do {
            let movies = try await movieService.fetchTrendingMovies()
            for movie in movies {
                print("""
                      ______________________________________________________________________________
                      \(movie.title) - Rate: \(movie.voteAverage)
                      \(movie.popularity) - Popularity \(movie.originalLanguage) - Original Language 
                      Description - \(movie.overview)
                      """)
            }
        } catch {
            print("Error of loading:", error)
        }
    }
}
