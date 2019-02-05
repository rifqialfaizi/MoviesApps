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
  //  var movieReviews = [Review]()
    
    var service = MovieDataService()
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestMovieReview()
    }
    

    var review: Review? {
        didSet{
            self.setMovieReviewView()
        }
    }
    
    var movie: Movie? {
        didSet{
            self.setMovieReviewView()
        }
    }
    
    func requestMovieReview() {
        /// mengakses movieId dengan guard agar type safe, sehingga ketika movieId bernilai nil fungsi akan berhenti sampai sini
        guard let id = self.movieId else { return }
        self.service.fetchMovieReview(withId: id, completion: { review, status in
            if status == true {
                self.review = review
            } else {
                print("Gagal melakukan request")
            }
        })
    }
    
    
    private func setMovieReviewView() {
        /// Akses variable movie, kenapa pake guard ? karena movie tipenya optional, ketika error akan STOP disini
        guard let review = review else { return }
        
        
    }
    
}

extension MovieReviewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTableView.dequeueReusableCell(withIdentifier: "reviewCell") as? ReviewCell else { return ReviewCell()}
        let review = review[indexPath.row]
        cell.configureReviewCell(with: review)
        cell.configureReviewCell(with: review)
        return cell
    }


}
