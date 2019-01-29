//
//  MovieService.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import Foundation
import Moya

enum MovieService {
    case readMovies
    
}

extension MovieService: TargetType {
    var baseURL: URL {
        return URL (string: "https://api.themoviedb.org/3/movie/popular?api_key=ef9a756edb9f70a44409da35278888bd&language=en-US&page=1")!
    }
    
    var path: String {
        switch self {
        case .readMovies :
            return "/movies"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .readMovies :
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .readMovies:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .readMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
