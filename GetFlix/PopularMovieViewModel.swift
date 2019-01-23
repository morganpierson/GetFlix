//
//  PopularMovieViewModel.swift
//  GetFlix
//
//  Created by Morgan Pierson on 1/22/19.
//  Copyright © 2019 Morgan Pierson. All rights reserved.
//

import Foundation
import UIKit

struct PopularMoviesViewModel {
    let title: String
    let overview: String
    let posterImage: UIImage
    let averageRating: Double
    
    init(model: PopularMovies, index: Int) {
        let movieTitle = model.movies[index].title
        self.title = movieTitle
        
        let movieOverview = model.movies[index].overview
        self.overview = movieOverview
        
        let moviePosterImage = model.movies[index].moviePosterImage
        self.posterImage = moviePosterImage
        
        let averageMovieRating = model.movies[index].averageRating
        self.averageRating = averageMovieRating
    }
}
