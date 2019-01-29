//
//  MovieCell.swift
//  MoviesApps
//
//  Created by Robihamanto on 29/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let identifier = "MovieCell"
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: Movies) {
        
    }

}
