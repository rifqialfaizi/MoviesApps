//
//  HomeViewController.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import Moya


class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [Movie]()
    var service = MovieDataService()
    var category = "Popular"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPopularMovie()
        configureCollectionView()
    }
    
    // TODO: Tambahin action Button untuk merubah category lainnya yaitu Upcoming, Now Playing & Top Rated Movie
    // Completed!
    
    @IBAction func changeCategoryButton(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Movies Category", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Popular", style: .default, handler: { _ in
            self.requestPopularMovie()
        }))
        alert.addAction(UIAlertAction(title: "Upcoming", style: .default, handler: { _ in
            self.requestUpcomingMovies()
        }))
        alert.addAction(UIAlertAction(title: "Now Playing", style: .default, handler: { _ in
            self.requestNowPlayingMovies()
        }))
        alert.addAction(UIAlertAction(title: "Top Rated", style: .default, handler: { _ in
            self.requestTopRatedMovies()
        }))
        self.present(alert, animated: true)
    }
    
    // TODO: Tambahin request untuk Upcoming, Now Playing & Top Rated Movie
    // Complete!
    
    // TODO: Tambah animasi untuk semua request ketika selesai di Popular, Upcoming, NowPlaying & Top Rated
    // Complete!
  
    
    
    
    func requestPopularMovie() {
        DispatchQueue.global(qos: .background).async {
            self.service.fetchPopularMovie { movies, status in
                if status == true { // Jika status sukses(true)
                    self.movies = movies
                    self.collectionView.reloadData()
                    self.reloadCollectionViewWithAnimation()
                    self.configureTitle(withTitle: "Popular 🎪")
                } else { // Jika gagal
                    print("Gagal melakukan request")
                }
            }
        }
    }
    
    func requestUpcomingMovies() {
        DispatchQueue.global(qos: .background).async {
            self.service.fetchUpcomingMovies { movies, status in
                if status == true {
                    self.movies = movies
                    self.reloadCollectionViewWithAnimation() // Melakukan reload data dengan animasi
                    self.configureTitle(withTitle: "Upcoming")
                } else {
                    print("Gagal melakukan request Up coming")
                }
            }
        }
    }
    
    func requestNowPlayingMovies() {
        DispatchQueue.global(qos: .background).async {
            self.service.fetchNowPlayingMovies { movies, status in
                if status == true {
                    self.movies = movies
                    self.reloadCollectionViewWithAnimation()
                    self.configureTitle(withTitle: "Now Playing")
                    
                } else {
                    print("Gagal melakukan request Now Playing")
                }
            }
        }
    }
    
    func requestTopRatedMovies() {
        DispatchQueue.global(qos: .background).async {
            self.service.fetchTopRatedMovies { movies, status in
                if status == true {
                self.movies = movies
                self.reloadCollectionViewWithAnimation()
                    self.configureTitle(withTitle: "Top Rated")
                } else {
                    print("Gagal melakakukan request Top Rated")
                }
        }
    }
}
    
    // TODO: Ubah title View Controller ketika user memilih kategori lainnya sesuai kategori saat ini
    // Complete!
    
    // TODO: Ubah nama fungsi configureUI menjadi nama yang merepresentasikan apa yang dilakukan fungsi tersebut
    // Complete!
    
    func configureTitle(withTitle title: String) {
        self.title = title
    }

    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCell()
    }
    
    /// Mendaftarkan cell ke collectionview dengan cara register XIB filenya
    func configureCell() {
        let nib = UINib(nibName: MovieCell.nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCell.reusableIdentifier)
    }
    
    /// Membuat animasi ketika reload collection view sehingga terlihat perbedaannya
    func reloadCollectionViewWithAnimation() {
        UIView.transition(with: collectionView, duration: 1.0, options: .transitionCurlUp, animations: {
            self.collectionView.reloadData()
        }, completion: nil)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.frame.width / 2
        let screenHeight = view.frame.height / 2
        /// Mengembalikan ukuran cell sesuai yang kita inginkan
        return  CGSize(width: screenWidth, height: screenHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /// Mengembalikan jumlah movie yang diperoleh dari response
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reusableIdentifier, for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        /// Mengirim object movie ke dalam cell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// Mencari sotorybaord dengan nama MovieDetail.storyboard
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        /// Inisialiasasi view controller dengan identifier MovieDetailViewController
        /// pada MovieDetail.storyboard dan meng-casting nya dengan class MovieDetailViewController
        guard let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else { return }
        /// Memberikan ID dari Movie pada detail view controller agar bisa melakukan request dengan ID yang diinginkan
        controller.movieId = movies[indexPath.row].id
        /// Malakukan push view controller, pindah screen ke view detail
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
