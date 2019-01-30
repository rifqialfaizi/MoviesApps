//
//  MovieDetailViewController.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import Moya
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    var movies: Movie? {
        didSet{
           self.movieDetail()
        }
    }

    
    var service = MovieDataService()


    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var dateReleased: UILabel!
    @IBOutlet weak var synopsis: UITextView!
    @IBOutlet weak var reviewBtnDidTap: UIButton!
    
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        print(movieId ?? 0)
    }
    

    
    // TODO: Buat request untuk load detail movie dari API : base_url/movie/{movie_id}
    // TODO: Tampilkan detail movie dari id yang telah disediakan di class ini (movieId)
    // TODO: Buat tampilan sesuai yang ada di line
    // Complete!

    
    private func movieDetail() {
        guard let movies = movies, let url = URL(string: "https://api.themoviedb.org/3/movie/{\(movieId)}") else {return}
        let resource = ImageResource(downloadURL: url, cacheKey: movies.title)
        posterImage.kf.setImage(with: resource )
        titleMovie.text = movies.title
        synopsis.text = movies.overView
        
    }
    
    
    
}
