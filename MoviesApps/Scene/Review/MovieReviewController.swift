//
//  MovieReviewController.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 01/02/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class MovieReviewController: UIViewController {
    
    
       var review = [Review]()
    
    
    @IBOutlet weak var reviewTableView: UITableView!
  //  var movieReviews = [Review]()
    
    var service = MovieDataService()
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestMovieReview()
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
    
}

extension MovieReviewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as? ReviewCell else { return ReviewCell()}
       
        
        cell.configureReviewCell(with: review[indexPath.row].author)
        
        
        return cell
    }


}
