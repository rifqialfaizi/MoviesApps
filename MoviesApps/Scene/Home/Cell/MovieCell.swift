//
//  MovieCell.swift
//  MoviesApps
//
//  Created by Robihamanto on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    
    static let nibName = "MovieCell"
    static let reusableIdentifier = "MovieCell"
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: Movie) {
        let posterImageUrl = "https://image.tmdb.org/t/p/w500/\(model.posterPath ?? "")"
        let url = URL(string: posterImageUrl)
        moviePosterImageView.kf.setImage(with: url)
    }

}
