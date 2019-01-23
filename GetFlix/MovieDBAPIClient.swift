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
    typealias MovieCompletionHandler = (Movie?, Error?) -> Void
    
    //create privat method to handle fetching movie data. func is asynchronous and will function in background
    private func getMovies(completionHandler completion: @escaping MovieCompletionHandler) {
        
    }
}
















