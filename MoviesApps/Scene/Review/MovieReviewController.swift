//
//  MovieReviewController.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 01/02/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class MovieReviewController: UIViewController {

    
    
    @IBOutlet weak var reviewTableView: UITableView!
    
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    
    
    var movieReviews = [Review]()
    
    var service = MovieDataService()
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestMovieReview()
    }
    

    
    
    var movie: Movie? {
        didSet{
            self.setMovieDetailView()
        }
    }
    
    func requestMovieReview() {
        /// mengakses movieId dengan guard agar type safe, sehingga ketika movieId bernilai nil fungsi akan berhenti sampai sini
        guard let id = self.movieId else { return }
        self.service.fetchMovieReview(withId: id, completion: { movie, status in
            if status == true {
                self.movie = movie
            } else {
                print("Gagal melakukan request")
            }
        })
    }
    
    
    private func setMovieDetailView() {
        /// Akses variable movie, kenapa pake guard ? karena movie tipenya optional, ketika error akan STOP disini
        guard let movie = movie else { return }
        
    }
    
}

extension MovieReviewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTableView.dequeueReusableCell(withIdentifier: "ReviewCell") as? ReviewCell else { return ReviewCell()}
      //  cell.updateView(movieReviews[indexPath.row].author, movieReviews[indexPath.row].content)
        return cell
    }


}
