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
    var categoryUpcoming = "Upcoming"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        
        requestUpcomingMovies()
        requestPopularMovie()
        configureCollectionView()
    }
    
    // TODO: Tambahin action Button untuk merubah category lainnya yaitu Upcoming, Now Playing & Top Rated Movie
    
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
    
    // TODO: Tambahin request untuk Latest, Now Playing & Top Rated Movie
    
    func requestPopularMovie() {
        DispatchQueue.global(qos: .background).async {
            self.service.fetchPopularMovie { movies, status in
                if status == true { // Jika status sukses(true)
                    self.movies = movies
                    self.collectionView.reloadData()
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
                } else {
                    print("Gagal melakakukan request Top Rated")
                }
        }
    }
}
    
    // TODO: Ubah title View Controller ketika user memilih kategori lainnya sesuai kategori saat ini
    
    func configureUI() {
        self.title = "\(category) 🎪"
        self.title = "\(categoryUpcoming)"
       
    }
 //   func configureUIUpcoming() {
  //      self.title = "\(categoryUpcoming)"
   // }
    
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
        UIView.transition(with: collectionView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.collectionView.reloadData()
        }, completion: nil)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = view.frame.width / 2
        let screenHeight = view.frame.height / 2
        return  CGSize(width: screenWidth, height: screenHeight) // Mengembalikan ukuran cell sesuai yang kita inginkan
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count // Mengembalikan jumlah movie yang diperoleh dari response
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reusableIdentifier, for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        cell.configure(with: movies[indexPath.row]) // Mengirim object movie ke dalam cell
        return cell
    }
    
    
}
