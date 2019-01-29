//
//  Movie.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case total_results
        case total_pages
        case movies = "results"
    }
}


struct Movie: Decodable {
    let id: Int?
    let title: String?
    let poster_path: String?
    let vote_average: Double?
}

