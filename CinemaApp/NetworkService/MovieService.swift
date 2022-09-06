//
//  MovieManager.swift
//  CinemaApp
//
//  Created by Никита Макаревич on 25.08.2022.
//

import Foundation

// https://www.omdbapi.com/?apikey=e1b20f1b&t=interstellar

protocol MovieServiceProtocol{
    
    func getMovie<T: Decodable>(title: String, completionHandler:@escaping (T) -> Void)
}

class MovieService: MovieServiceProtocol{
    
    func getMovie<T>(title: String, completionHandler: @escaping (T) -> Void) where T : Decodable {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=e1b20f1b&t=\(title)&plot=full") else{ return }
        
        getRequest(url: url) { data in
            guard let model = try? JSONDecoder().decode(T.self, from: data)
            else{
                print("Error while decoding")
                return
            }
            completionHandler(model)
            
        }
    }
}

private extension MovieService{
    func getRequest(url: URL, completion: @escaping (Data)->Void){
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else{ return }
            completion(data)
        }
        task.resume()
    }
}

