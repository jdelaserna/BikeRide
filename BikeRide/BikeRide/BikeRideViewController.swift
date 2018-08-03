//
//  ViewController.swift
//  BikeRide
//
//  Created by Jorge Serna on 2018-06-12.
//  Copyright © 2018 Jorge Serna. All rights reserved.
//

import UIKit
import CoreLocation

class BikeRideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var rides = [BikeRide]()
    var searchRides = [BikeRide]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRides()
        setUpSearchBar()
 
    }
    
    private func setUpRides() {
        
        rides.append(BikeRide(title: "Stanley Park Ride", map: "stanleyPark", people: "🚴🏻‍♂️🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★★", level: "💪🏼", source: CLLocationCoordinate2D(latitude:49.313172886419686 , longitude: -123.14659737991593), destination: CLLocationCoordinate2D(latitude:49.290231432567666 , longitude: -123.12242121699967)))
        rides.append(BikeRide(title: "Deep Cove Ride", map: "deepCove", people: "🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★", level: "💪🏼💪🏼💪🏼", source: CLLocationCoordinate2D(latitude:49.305105505966345 , longitude: -122.94879058207289), destination: CLLocationCoordinate2D(latitude:49.33311309678001 , longitude: -122.9362483801429)))
        rides.append(BikeRide(title: "Whistler Ride", map: "whistler", people: "🚴🏻‍♂️🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★", level: "💪🏼💪🏼💪🏼", source: CLLocationCoordinate2D(latitude:50.120688162655306 , longitude: -122.98370361328125), destination: CLLocationCoordinate2D(latitude:50.081615068265094 , longitude: -122.88010125924939)))
        rides.append(BikeRide(title: "UBC Ride", map: "ubc", people: "🚴🏻‍♂️", rating: "★★", level: "💪🏼💪🏼", source: CLLocationCoordinate2D(latitude:49.27402089276751 , longitude: -123.15459251403809), destination: CLLocationCoordinate2D(latitude:49.277324755793906 , longitude: -123.25081377478028)))
        rides.append(BikeRide(title: "Victoria Ride", map: "victoria", people: "🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★★", level: "💪🏼💪🏼", source: CLLocationCoordinate2D(latitude:48.479976817079226 , longitude: -123.54812622070312), destination: CLLocationCoordinate2D(latitude:48.56365800726797 , longitude: -123.47087860107422)))
        rides.append(BikeRide(title: "Boundary Bay Ride", map: "boundaryBay", people: "🚴🏻‍♂️", rating: "★", level: "💪🏼", source: CLLocationCoordinate2D(latitude:49.02544912363068 , longitude: -122.86724124358011), destination: CLLocationCoordinate2D(latitude:49.02409785223232 , longitude: -123.06158689104979)))
        rides.append(BikeRide(title: "Horseshoe Bay Ride", map: "horseshoe", people: "🚴🏻‍♂️🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★★★", level: "💪🏼💪🏼💪🏼", source: CLLocationCoordinate2D(latitude:49.339001513704034 , longitude: -123.2676747131153), destination: CLLocationCoordinate2D(latitude:49.45824468769715 , longitude: -123.23986557004889)))
        rides.append(BikeRide(title: "Indian Arm Ride", map: "indianArm", people: "🚴🏻‍♂️🚴🏻‍♂️", rating: "★★★", level: "💪🏼💪🏼💪🏼", source: CLLocationCoordinate2D(latitude:49.319918713396014 , longitude: -122.9278070157402), destination: CLLocationCoordinate2D(latitude:49.33932908653162 , longitude: -122.85890579223633)))
        rides.append(BikeRide(title: "Maple Ridge Ride", map: "indianArm", people: "🚴🏻‍♂️", rating: "★", level: "💪🏼💪🏼", source: CLLocationCoordinate2D(latitude:49.19987783792603 , longitude: -122.59471893310547), destination: CLLocationCoordinate2D(latitude:49.24225892596105 , longitude: -122.38906860351562)))
        rides.append(BikeRide(title: "Tofino Ride", map: "indianArm", people: "🚴🏻‍♂️", rating: "★★★", level: "💪🏼", source: CLLocationCoordinate2D(latitude:49.06846786975949 , longitude: -125.75328826904297), destination: CLLocationCoordinate2D(latitude:49.120848968473425 , longitude: -125.89714050292969)))
        
        searchRides = rides
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? BikeRideDetailViewController
        destination?.ride = rides[(tableView.indexPathForSelectedRow?.row)!]
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchRides.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "BikeRideCell", for: indexPath) as! BikeRideTableViewCell
//        cell.config(with: rides[indexPath.row])
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BikeRideCell") as? BikeRideTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = searchRides[indexPath.row].title
        cell.descriptionLabel.text = "\(searchRides[indexPath.row].level) - \(searchRides[indexPath.row].people) - \(searchRides[indexPath.row].rating)"

        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchRides = rides.filter({ bikeRide -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                return bikeRide.title.lowercased().contains(searchText.lowercased())
            default:
                return false
            }
        })
        tableView.reloadData()
    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entered: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exited: \(region.identifier)")
    }
    
}
