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
    var totalResults: Int?
    var totalPages: Int?
    var movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}


struct Movie: Decodable {
    let id: Int?
    let title: String?
    let posterPath: String?
    let overView: String?
   
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overView
        case posterPath = "poster_path"
    
    }
}

