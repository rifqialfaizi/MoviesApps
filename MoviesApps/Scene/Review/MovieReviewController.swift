//
//  MovieReviewController.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 01/02/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit



class MovieReviewController: UIViewController {

       var reviews = [Review]()
    
    
    @IBOutlet weak var reviewTableView: UITableView!
    
    var service = MovieDataService()
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        requestMovieReview()
        
    }
    
    // TODO: Gaperlu ada object movie karena kita hanya ingin menampilkan review saja tanpa detail filmnya

    
    func requestMovieReview() {
    
        guard let id = self.movieId else { return }
        self.service.fetchMovieReview(withId: id, completion: { review, status in
            if status == true {
                self.reviews = review
            } else {
                print("Gagal melakukan request")
            }
        })
    }
    
    func setMovieReviewView() {
        
    }
    
}

extension MovieReviewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reviewTableView.dequeueReusableCell(withIdentifier: "ReviewCell") as? ReviewCell else { return ReviewCell()}
       
        
        cell.configureReviewCell(with: reviews[indexPath.row])
        
        
        return cell
    }


}
