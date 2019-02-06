//
//  MovieDataService.swift
//  MoviesApps
//
//  Created by Robihamanto on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import Moya

class MovieDataService {
    
    //Plugin Network Logger untuk menampilkan log dari request
    let provider = MoyaProvider<MovieService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    
    /// Menambahkan parameter id untuk memanggil request ke API
    
    func fetchMovieReview(withId id: Int, completion: @escaping(([Review], Bool) -> ())) {
        provider.request(.fetchMovieReview(id: id)) { result in
            switch result {
            case .success(let response):
                guard let data = try? JSONDecoder().decode(Reviews.self, from: response.data) as Reviews else {
                    completion([], false)
                    return
                }
                completion(data.reviews ?? [], true)
            case .failure(let error):
                completion([], false)
                print(error.errorDescription ?? "")
            }
        }
    }
    
    func fetchMovieDetail(withId id: Int, completion: @escaping((Movie?, Bool) -> ())) {
        provider.request(.fetchMovieDetail(id: id)) { result in
            switch result {
            case .success(let response):
                guard let data = try? JSONDecoder().decode(Movie.self, from: response.data) as Movie else {
                    completion(nil, false)
                    return
                }
                completion(data, true)
            case .failure(let error):
                completion(nil, false)
                print(error.errorDescription ?? "")
            }
        }
    }
    
    func fetchTopRatedMovies(completion: @escaping(([Movie], Bool) -> ())) {
        provider.request(.fetchTopRatedMovies()){ result in
            switch result {
            case .success(let response):
                guard  let data = try? JSONDecoder().decode(Movies.self, from: response.data) as Movies else {
                    completion([], false)
                    return
                }
                completion(data.movies ?? [], true)
            case .failure(let error):
                completion([], false)
                print(error.errorDescription ?? "")
            }
        }
    }
    
    func fetchNowPlayingMovies(completion: @escaping(([Movie], Bool) -> ())) {
        provider.request(.fetchNowPlayingMovies()) { result in
            switch result {
            case .success(let response):
                guard let data = try? JSONDecoder().decode(Movies.self, from: response.data) as Movies else {
                    completion([], false)
                    return
                }
                
                completion(data.movies ?? [], true)
                
            case .failure(let error):
                completion([], false)
                print(error.errorDescription ?? "")
            }
        }
    }
    
    func fetchUpcomingMovies(completion: @escaping(([Movie], Bool) -> ())) {
        provider.request(.fetchUpcomingMovies()) { result in
            switch result {
            case .success(let response):
                guard let data = try? JSONDecoder().decode(Movies.self, from: response.data) as Movies else {
                    completion([], false)
                    return
                }
                
                completion(data.movies ?? [], true)
                
            case .failure(let error):
                completion([], false)
                print(error.errorDescription ?? "")
            }
        }
    }

    /// Escaping dipakai untuk memberitahu ketika request telah selesai dilakukan
    /// Tipe kembalian pertama [Movie] yang kita butuhkan adalah List dari Object Movie
    /// Tipe kembalian kedua adalah Bool yaitu keterangan bahwa request kita berhasil(true) atau gagal(false)
    func fetchPopularMovie(completion : @escaping(([Movie], Bool) -> ())) {
        /// Moya provide melakukan request ke fetchPopularMovies
        provider.request(.fetchPopularMovies()) { result in
            
            /// Handle response dari moya dengan menggunakan switch
            /// Terdapat 2 jenis yaitu case .success / case .error
            switch result {
            case .success(let response):
                /// Kita coba mendecode(membuka bungkusan response API) response dari Moya dengan guard let
                /// Kalau gagal akan mengembalikan closure dengan tipe kembalian false
                guard let data = try? JSONDecoder().decode( Movies.self, from: response.data) as Movies else {
                    completion([], false) // Ini adalah contoh jika success melakukan request akan tetapi gagal melakukan decode sehingga kita kembalikan dengan (array kosong, dan status error(false)
                    return
                }
                /// Pengembalian ([movie], status) kenapa ada "??" karna movies sifatnya optional jadi kita harus sediain default value
                /// atau semacam kalau error harus diganti apa
                completion(data.movies ?? [], true) // Ini adalah contoh jika success melakukan request lalu kita mengembalikan array object Movie dan status sukses(true)
            case .failure(let error):
                completion([], false) // Ini adalah contoh jika error melakukan request sehingga kita kembalikan dengan (array kosong, dan status error(false)
                print(error.errorDescription ?? "")
            }
        }
    }
}
