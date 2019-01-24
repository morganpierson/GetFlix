//
//  PopularMovies.swift
//  GetFlix
//
//  Created by Morgan Pierson on 1/22/19.
//  Copyright © 2019 Morgan Pierson. All rights reserved.
//

import Foundation
import UIKit

struct Movie: Codable {
    
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let vote_average: Double?
}

struct PopularMovies: Codable {
    let results: [Movie]
}
