//
//  BikeRideCellViewController.swift
//  BikeRide
//
//  Created by Jorge Serna on 2018-06-19.
//  Copyright © 2018 Jorge Serna. All rights reserved.
//

import UIKit

class BikeRideDetailViewController: UIViewController {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mapView: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var ride:BikeRide?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ride?.title
        mapView.image = UIImage(named: (ride?.map)!)
        levelLabel.text = ride?.level
        peopleLabel.text = ride?.people
        ratingLabel.text = ride?.rating
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
