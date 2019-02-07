//
//  Review.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import Foundation

struct Reviews: Decodable {
    var id: Int?
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    var reviews: [Review]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case reviews = "results"
    }
}

struct Review: Decodable {
    let id: Int?
    let author: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content

        
    }
}
