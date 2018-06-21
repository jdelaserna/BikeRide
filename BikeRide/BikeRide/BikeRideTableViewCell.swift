//
//  BikeRideTableViewCell.swift
//  BikeRide
//
//  Created by Jorge Serna on 2018-06-13.
//  Copyright © 2018 Jorge Serna. All rights reserved.
//

import UIKit

class BikeRideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    func config(with bikeRide: BikeRide){
        titleLabel.text = bikeRide.title
        descriptionLabel.text = "\(bikeRide.level) - \(bikeRide.people) - \(bikeRide.rating)"
    }
    
}
