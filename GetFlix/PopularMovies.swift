//
//  PopularMovies.swift
//  GetFlix
//
//  Created by Morgan Pierson on 1/22/19.
//  Copyright © 2019 Morgan Pierson. All rights reserved.
//

import Foundation
import UIKit

//create a model for individual movie object
struct Movie: Codable {
    
    let original_title: String
    let overview: String
    let poster_path: String
    let vote_average: Double
}

//create popular movies model with one type results which is an array of Movie objects
struct PopularMovies: Codable {
    let results: [Movie]
}

