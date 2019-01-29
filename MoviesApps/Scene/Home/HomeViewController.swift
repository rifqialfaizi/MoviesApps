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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestPopularMovie()
        configureCell()
    }

    func requestPopularMovie() {
        service.fetchPopularMovie { movies, status in
            /// Jika status sukses(true)
            if status == true {
                self.movies = movies
                self.collectionView.reloadData()
            } else {
                print("Gagal melakukan request")
            }
        }
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
   
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count // Mengembalikan jumlah movie yang diperoleh dari response
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reusableIdentifier, for: indexPath) as? MovieCell else { return UICollectionViewCell() }
        cell.configure(with: movies[indexPath.row]) // Mengirim object movie ke dalam cell
        return cell
    }
    
    
}
