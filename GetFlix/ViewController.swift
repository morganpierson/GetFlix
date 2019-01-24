//
//  ViewController.swift
//  GetFlix
//
//  Created by Morgan Pierson on 1/22/19.
//  Copyright © 2019 Morgan Pierson. All rights reserved.
//
//This product uses the TMDb API but is not endorsed or certified by TMDb.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appLabel: UILabel!
   
    let API_KEY = "f6840ab8b085a8f365cf977cf91c3296"
    
    let client = MovieDBAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.getPopularMovies() {[unowned self] movies, error in
            
            if let movieList = movies {
                print(movieList)
            } else {
                print(error) 
            }
        }
    }

}

