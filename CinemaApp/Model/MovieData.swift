//
//  MovieData.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 25.08.2022.
//

import Foundation

 // https://www.omdbapi.com/?apikey=e1b20f1b&t=interstellar
struct MovieData: Codable{
    let Title: String
    let Year: String
    let Genre: String
    let Runtime: String
    let Poster: String
    let Ratings: [Ratings]
}

struct Ratings: Codable{
    let Value: String
}
