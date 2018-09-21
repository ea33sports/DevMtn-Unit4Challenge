//
//  MovieTableViewCell.swift
//  Unit 4 Challenge
//
//  Created by Eric Andersen on 9/21/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movie: EDAMovie? {
        didSet {
            updateViews()
        }
    }

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    func updateViews() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        overviewLabel.text = movie.overview
    }
}
