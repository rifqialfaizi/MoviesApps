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
    case fetchPopularMovies()
    case fetchUpcomingMovies()
}

extension MovieService: TargetType {
    var baseURL: URL {
        return URL (string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .fetchPopularMovies :
            return "/movie/popular"
        case .fetchUpcomingMovies:
            return "/movie/upcoming"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPopularMovies:
            return .get
        case .fetchUpcomingMovies:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            
        case .fetchPopularMovies:
            var params: [String: Any] = [:]
            params["api_key"] = API_KEY
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
            
        case .fetchUpcomingMovies:
            var params: [String: Any] = [:]
            params ["api_key"] = API_KEY
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
