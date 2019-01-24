//
//  ViewController.swift
//  GetFlix
//
//  Created by Morgan Pierson on 1/22/19.
//  Copyright © 2019 Morgan Pierson. All rights reserved.
//
//This product uses the TMDb API but is not endorsed or certified by TMDb.

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var appLabel: UILabel!
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    //create instance of MovieDBAPIClient class
    let client = MovieDBAPIClient()
    
    //URL to be used for fetching movie poster image
    let posterURL = "https://image.tmdb.org/t/p/w500"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call getPopularMovies method from movie db api and collect list of popular movies
        client.getPopularMovies() {[unowned self] movies, error in
            
            if let movieList = movies {
                let movieListResults = movieList.results
                
                //iterate through movieList results and programmatically update UI
                for i in 0..<movieListResults.count {
                    //create failable moviePosterURL
                    guard let moviePosterURL = URL(string: "\(self.posterURL)\(movieListResults[i].poster_path)") else {return}
                    
                    //create an image resource using Kingfisher cocoapod ImageResource functionality
                    let imageResource = ImageResource(downloadURL: moviePosterURL, cacheKey: movieListResults[i].original_title)
                    
                    //create intances of UIImageView and UILabel to be programatically added
                    let imageView = UIImageView()
                    let textView = UILabel()
                    let x = self.view.frame.size.width * CGFloat(i)
                    
                    //programmatically set imageView properties
                    imageView.frame = CGRect(x: x, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
                    imageView.contentMode = .scaleAspectFit
                    imageView.image = UIImage(named: movieListResults[i].poster_path)
                    imageView.kf.setImage(with: imageResource)
                    
                    
                    //programatically set textView properties
                    textView.frame = CGRect(x: x, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
                    textView.contentMode = .scaleAspectFit
                    textView.text = movieListResults[i].overview
                    textView.textAlignment = .center
                    textView.numberOfLines = 100
                    textView.textColor = .white
                    textView.font = UIFont(name: textView.font.fontName, size: 25)
                    
                    //set scrollView parameters and add imageView as subview
                    self.scrollView.isPagingEnabled = true
                    self.scrollView.contentSize.width = self.scrollView.frame.size.width * CGFloat(i + 1)
                    self.scrollView.addSubview(imageView)
                    //set textView as subview of scrollView below imageView
                    self.scrollView.insertSubview(textView, belowSubview: imageView)
                    
                    //add long press gesture recognition to imageView
                    let tapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(gesture:)))
                    tapGestureRecognizer.minimumPressDuration = 0.1
                    imageView.addGestureRecognizer(tapGestureRecognizer)
                    imageView.isUserInteractionEnabled = true
                }
            } else {
                print(error) 
            }
        }
    }


    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil && gesture.state == .began{
            gesture.view?.isHidden = true
        } else if gesture.state == .ended {
            gesture.view?.isHidden = false

        }
}
}
