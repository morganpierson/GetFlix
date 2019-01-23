//
//  PopularMovies.swift
//  GetFlix
//
//  Created by Morgan Pierson on 1/22/19.
//  Copyright © 2019 Morgan Pierson. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    let title: String
    let overview: String
    let moviePosterImage: UIImage
    let averageRating: Double
}

struct PopularMovies {
    let movies: [Movie]
}
