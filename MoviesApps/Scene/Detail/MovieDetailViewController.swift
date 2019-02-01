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
    // Complete!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var reviewBtn: UIButton!
    
    
    var service = MovieDataService()
    var movieId: Int?
    
    /// Nama variable harus merepresentasikan isinya, kalau movies itu artinya jamak berarti lebih dari 1
    /// biasanya dalam bentuk array seperti movies: [Movies] padahal movie detail hanya ada 1 movie aja
    // TODO: Ubah nama movies jadi movie karna movie bentuknya bukan jamak/array
    // Complete!
    
 
    var movie: Movie? {
        didSet{
            self.setMovieDetailView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestMovieDetail()
        setUpNavBarTitle()
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
                self.movie = movie
            } else {
                print("Gagal melakukan request")
            }
        })
    }


    // TODO: Ubah nama fungsi sesuai dengan tugasnya
    /// Ubah nama dari fungsi movieDetail() menjadi setMovieDetailView()
    // Complete!
    
    private func setMovieDetailView() {
        /// Akses variable movie, kenapa pake guard ? karena movie tipenya optional, ketika error akan STOP disini
        guard let movie = movie else { return }
        
        let url = URL(string: movie.posterPath?.imagePathToUrl() ?? "") // Kenapa ada "??" artinya memberikan nilai default string kosong ketika posterPath bernilai nil
        posterImageView.kf.setImage(with: url) // Set image ke ImageView dengan Library Kingfisher, sudah otomatis
        posterImageView.kf.indicatorType = .activity // memberikan animasi sctivity indicator ketika sedang load image ke server
        
        titleMovieLabel.text = movie.title
        synopsisTextView.text = movie.overview
        releaseDateLabel.text = movie.release_date // added
        
    }
    
    // TODO: Ubah title view controller sesuai dengan judul film
    // Complete but failed
    // TODO: Tambahkan button review untuk melihat daftar review dari movie detail
    
    private func setUpNavBarTitle() {
        
        guard let title = movie else { return }
        
        self.navigationItem.title = title.title // kenapa dia nil? kalau misalkan code nya seperti ini:
        
        // private func setUpNavBarTitle() {
        
        // self.navigationItem.title = movie?.title // nantinya tidak ada apa2. jika seperti ini:
        // self.navigationItem.title = "\(movie?.title)" // nantinya title menjadi bertuliskan ( nil )
        
}
    
    
    @IBAction func reviewBtnWasPressed(_ sender: Any) {
       
        guard let controller = storyboard!.instantiateViewController(withIdentifier: "MovieReviewController") as? MovieReviewController else { return }
        
        controller.movieId = movie?.id
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
    
}
