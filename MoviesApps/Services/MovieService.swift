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
}
enum LatestMovies {
    case fetchLatestMovies()
}

extension LatestMovies: TargetType {
    var baseURL: URL {
        return URL (string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .fetchLatestMovies:
            return "/movie/latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchLatestMovies:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchLatestMovies:
            var params: [String: Any] = [:]
            params ["api_key"] = API_KEY
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}

extension MovieService: TargetType {
    var baseURL: URL {
        return URL (string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .fetchPopularMovies :
            return "/movie/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPopularMovies() :
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
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
