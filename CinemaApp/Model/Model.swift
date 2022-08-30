//
//  Model.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 26.08.2022.
//

import Foundation

protocol ModelProtocol{
    func getMovies(completion: @escaping(MovieData) -> Void)
}

final class Model{
    private var network: MovieServiceProtocol
    private var movieArray = ["Free Guy",
                              "Star Wars: Episode VIII - The Last Jedi",
                              "Dune",
                              "Green Book",
                              "Avengers: Endgame",
                              "Cruella",
                              "Marvel",
                              "wolf of wall street",
                              "Moonlight",
                              "Top Gun: Maverick",
                              "The Suicide Squad",
                              "Interstellar"
    ]
    
    init(network: MovieServiceProtocol = MovieService()) {
        self.network = network
    }
    
}

extension Model: ModelProtocol{
    func getMovies(completion: @escaping (MovieData) -> Void) {
        
        for movie in movieArray{
            let rightMovieName = movie.replacingOccurrences(of: " ", with: "%20")
            network.getMovie(title: rightMovieName, completionHandler: completion)
        }
    }
    
    
}

