//
//  ReviewCell.swift
//  MoviesApps
//
//  Created by Robihamanto on 07/02/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
    
    
    static let identifier = "ReviewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureReviewCell(with review: Review) {
        authorLabel.text = review.author
        reviewTextView.text = review.content
        
    }
    
}
