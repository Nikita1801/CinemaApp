//
//  MoviePresenter.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 25.08.2022.
//

import UIKit

protocol MoviePresenterProtocol{
    
    func getMovies()
    
    func searchButtonTapped()
    
    func profileButtonTapped()
}




final class MoviePresenter{
    

    private weak var movieViewController: MovieViewControllerProtocol?
    private var model: ModelProtocol
    private var moviesArray: [MovieModel] = []
    
    init(movieViewController: MovieViewControllerProtocol?, model: ModelProtocol = Model()) {
        self.model = model
        self.movieViewController = movieViewController
    }
    
    func convertValues(movie: MovieData) -> MovieModel{
        
        // get part only with digits. For example from "160 min" we take only "160"
        let digitPartRuntime = Int(movie.Runtime.components(separatedBy: " ")[0])
        
        // get part only with rating. For example form "8.6/10" we take only "8.6"
        let firstPartOfRating = movie.Ratings[0].Value.components(separatedBy: "/")[0]
        
        if let digitPartRuntime = digitPartRuntime {
            
            let hours = digitPartRuntime / 60
            let mins = digitPartRuntime % 60
            
            return MovieModel(title: movie.Title, genre: movie.Genre, year: movie.Year, runtime: "\(hours)h \(mins)min", ratings: firstPartOfRating, poster: movie.Poster)
        }
        else {
            return MovieModel(title: movie.Title, genre: movie.Genre, year: movie.Year, runtime: movie.Runtime, ratings: firstPartOfRating, poster: movie.Poster)
        }
    }
}

extension MoviePresenter: MoviePresenterProtocol{
   
    func getMovies() {
        model.getMovies { [weak movieViewController] movie in
            self.moviesArray.append(self.convertValues(movie: movie))
            DispatchQueue.main.async {
                movieViewController?.updateMovies(self.moviesArray)
            }
        }
    }
    
    func searchButtonTapped() {
        print("SearchButtonTapped")
    }
    
    func profileButtonTapped(){
        
        print("ProfileButtonTapped")
    }
    
}

