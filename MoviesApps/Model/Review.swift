//
//  Review.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import Foundation

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
