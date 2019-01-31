//
//  MovieDetailViewController.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    /// Pemberian nama variable dari view harus merepresentasikan tipe dari jenis apa variable tersebut
    /// Ubah nama variable ditambahi dengan jenis namanya
    
    // TODO: ubah posterImage menjadi posterImageView, titleMovie menjadi titleMovieLablel dst...
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var synopsis: UITextView!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    var service = MovieDataService()
    var movieId: Int?
    
    /// Nama variable harus merepresentasikan isinya, kalau movies itu artinya jamak berarti lebih dari 1
    /// biasanya dalam bentuk array seperti movies: [Movies] padahal movie detail hanya ada 1 movie aja
    // TODO: Ubah nama movies jadi movie karna movie bentuknya bukan jamak/array
    var movies: Movie? {
        didSet{
            self.movieDetail()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestMovieDetail()
    }
    
    // TODO: Buat request untuk load detail movie dari API : base_url/movie/{movie_id}
    // Complete!
    // TODO: Tampilkan detail movie dari id yang telah disediakan di class ini (movieId)
    // Complete!
    // TODO: Buat tampilan sesuai yang ada di line
    // Complete!
    
    func requestMovieDetail() {
        /// mengakses movieId dengan guard agar type safe, sehingga ketika movieId bernilai nil fungsi akan berhenti sampai sini
        guard let id = self.movieId else { return }
        self.service.fetchMovieDetail(withId: id, completion: { movie, status in
            if status == true {
                self.movies = movie
            } else {
                print("Gagal melakukan request")
            }
        })
    }


    // TODO: Ubah nama fungsi sesuai dengan tugasnya
    /// Ubah nama dari fungsi movieDetail() menjadi setMovieDetailView()
    private func movieDetail() {
        /// Akses variable movie, kenapa pake guard ? karena movie tipenya optional, ketika error akan STOP disini
        guard let movie = movies else { return }
        
        let url = URL(string: movie.posterPath?.imagePathToUrl() ?? "") // Kenapa ada "??" artinya memberikan nilai default string kosong ketika posterPath bernilai nil
        posterImage.kf.setImage(with: url) // Set image ke ImageView dengan Library Kingfisher, sudah otomatis
        posterImage.kf.indicatorType = .activity // memberikan animasi sctivity indicator ketika sedang load image ke server
        
        titleMovie.text = movie.title
        synopsis.text = movie.overview
        releaseDate.text = movie.release_date // added
        
    }
    
    // TODO: Ubah title view controller sesuai dengan judul film
    // TODO: Tambahkan button review untuk melihat daftar review dari movie detail
    
    
    
}
