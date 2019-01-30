//
//  MovieDetailViewController.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

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

}
