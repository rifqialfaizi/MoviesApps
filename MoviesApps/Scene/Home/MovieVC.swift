//
//  MovieVC.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import Moya


class MovieVC: UITableViewController {

    var movies = [Movie]()
    var service = MovieDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPopularMovie()
    }

    func requestPopularMovie() {
        service.fetchPopularMovie { movies, status in
            /// Jika status sukses(true)
            if status == true {
                print(movies)
            } else {
                print("Gagal melakukan request")
            }
        }
    }
   
}
