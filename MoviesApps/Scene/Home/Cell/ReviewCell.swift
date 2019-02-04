//
//  ReviewCell.swift
//  MoviesApps
//
//  Created by Rifqi Alfaizi on 01/02/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {


    
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureReviewCell(with model: Review) {
        authorsLabel.text = model.author
        contentTextView.text = model.content
      
    }
 
    }

    
    
    


