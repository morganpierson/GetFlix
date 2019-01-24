//
//  MovieDBAPIClient.swift
//  GetFlix
//
//  Created by Morgan Pierson on 1/22/19.
//  Copyright © 2019 Morgan Pierson. All rights reserved.
//

import Foundation

class MovieDBAPIClient {
    //for sake of small scope app, simply save api key to fileprivate constant
    fileprivate let API_KEY = "f6840ab8b085a8f365cf977cf91c3296"
    
    //create lazy url to be used later on in app
    lazy var baseURL: URL = {
        return URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(self.API_KEY)&language=en-US&page=1")!
    }()
    
    //create constant that will handle JSON decoding functionality
    let decoder = JSONDecoder()
    
    //create session constant to be used in api session interaction
    let session: URLSession
    
    //create URLSession instance upon class initialization
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    
    //create type alias for shorthand closure type definition in getMovies function
    typealias MovieCompletionHandler = (PopularMovies?, Error?) -> Void
    
    //create privat method to handle fetching movie data. func is asynchronous and will function in background
    private func getMovies(completionHandler completion: @escaping MovieCompletionHandler) {
        
        //create request instance based on baseURL
        let request = URLRequest(url: baseURL)
        
        //define session task responsible for asynchronously fetching data
        let task = session.dataTask(with: request) { data, response, error in
            //dispatch successful data back to main thread once complete
            DispatchQueue.main.async {
                //make sure data exists from request
                if let data = data {
                    //check response cast as HTTPURLRESPONSE
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, error)
                        return
                    }
                    print("DATA: ", data)
                    if httpResponse.statusCode == 200 {
                        do {
                            //save successfully decoded movie data with type we want to use as model reference for data
                            let movie = try self.decoder.decode(PopularMovies.self, from: data)
                            print("movie: ", movie)
                            //call completion handler with successful movie data
                            completion(movie, nil)
                        } catch {
                            print("ERROR DECODING: ", error)
                            completion(nil, error)
                        }
                    } else {
                        print("ERROR: ", httpResponse.statusCode)
                        completion(nil, error)
                    }
                }
            }
        }
        
        //fire data task
        task.resume()
    }
    
    //define non-private function to be used outside of this file
    func getPopularMovies(completionHandler completion: @escaping MovieCompletionHandler) {
        //call asynchronous private method
        getMovies() {movie, error in
            completion(movie, error)
        }
    }
}
















