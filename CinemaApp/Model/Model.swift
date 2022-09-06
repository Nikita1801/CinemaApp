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
                              "127 Hours",
                              "wolf of wall street",
                              "Moonlight",
                              "Top Gun: Maverick",
                              "The Suicide Squad",
                              "Interstellar",
                              "Bullet Train",
                              "Beast",
                              "Brighton Rock",
                              "The ides of March",
                              "The Tall Man",
                              "The Descendants",
                              "I’m Still Here",
                              "The Raven",
                              "Lord of War",
                              "The Hobbit: An Unexpected Journey",
                              "War Horse",
                              "Bohemian Rhapsody",
                              "Hell and Back Again",
                              "Tinker, Tailor, Soldier, Spy",
                              "Wonder Woman",
                              "Us",
                              "Kingsman: The Secret Service",
                              "Get Out",
                              "Titanic",
                              "Uncharted"
    ]
    
    init(network: MovieServiceProtocol = MovieService()) {
        self.network = network
    }
    
}

extension Model: ModelProtocol{
    func getMovies(completion: @escaping (MovieData) -> Void) {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        DispatchQueue.global().asyncAfter(deadline: .now()) {
            for movie in self.movieArray{
                let rightMovieName = movie.replacingOccurrences(of: " ", with: "%20")
                self.network.getMovie(title: rightMovieName, completionHandler: completion)
//                dispatchGroup.leave()
            }
        }
        
    }
}

