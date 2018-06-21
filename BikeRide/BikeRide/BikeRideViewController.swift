//
//  ViewController.swift
//  BikeRide
//
//  Created by Jorge Serna on 2018-06-12.
//  Copyright © 2018 Jorge Serna. All rights reserved.
//

import UIKit

class BikeRideViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var rides: [BikeRide] = [
        BikeRide(title: "Stanley Park Ride", map: "stanleyPark", people: "🚴🏻‍♂️🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★★", level: "💪🏼"),
        BikeRide(title: "Deep Cove Ride", map: "deepCove", people: "🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★", level: "💪🏼💪🏼💪🏼"),
        BikeRide(title: "Downtown Ride", map: "downtown", people: "🚴🏻‍♂️", rating:  "★★★★", level: "💪🏼"),
        BikeRide(title: "Whistler Ride", map: "whistler", people: "🚴🏻‍♂️🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★", level: "💪🏼💪🏼💪🏼"),
        BikeRide(title: "UBC Ride", map: "ubc", people: "🚴🏻‍♂️", rating: "★★", level: "💪🏼💪🏼"),
        BikeRide(title: "Queen Elizabeth Park Ride", map: "queenElizabeth", people: "🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★", level: "💪🏼"),
        BikeRide(title: "Victoria Ride", map: "victoria", people: "🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★★", level: "💪🏼💪🏼"),
        BikeRide(title: "Boundary Bay Ride", map: "boundaryBay", people: "🚴🏻‍♂️", rating: "★", level: "💪🏼"),
        BikeRide(title: "Horseshoe Bay Ride", map: "horseshoe", people: "🚴🏻‍♂️🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★★", level: "💪🏼💪🏼💪🏼"),
        BikeRide(title: "Indian Arm Ride", map: "indianArm", people: "🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★", level: "💪🏼💪🏼💪🏼")

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? BikeRideDetailViewController
        destination?.ride = rides[(tableView.indexPathForSelectedRow?.row)!]
    }

    
}

extension BikeRideViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rides.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeRideCell", for: indexPath) as! BikeRideTableViewCell
        cell.config(with: rides[indexPath.row])
        
        return cell
    }
}
