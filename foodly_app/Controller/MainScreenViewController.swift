//
//  ViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 24/08/2021.
//

import UIKit
import CoreLocation

class MainScreenViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var allRestaurantsTableView: UITableView!
    
    var restaurants = [] as [Restaurant]
    var menu = [] as [MenuSection]
    
    let locationManager = CLLocationManager()
    
    private var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        allRestaurantsTableView.delegate = self
        allRestaurantsTableView.dataSource = self
        
        self.registerTableViewCells()
        self.navigationItem.backButtonTitle = " "
    
        fetchRestaurantInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
                currentLocation = location
                setDistanceAndSort()
            }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location didFailWithError:  \(error)")
    }
    
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "RestaurantListTableViewCell", bundle: nil)
        self.allRestaurantsTableView.register(textFieldCell, forCellReuseIdentifier: "RestaurantListTableViewCell")
        
    }
    
    private func setDistanceAndSort() {
        for i in restaurants.indices {
            let distance = currentLocation?.distance(from: CLLocation(latitude: restaurants[i].latitude, longitude: restaurants[i].longitude))
            restaurants[i].distanceTo = distance
        }
        restaurants.sort(by: {$0.distanceTo! < $1.distanceTo!})
        
        self.allRestaurantsTableView.reloadData()
    }
    
    // API fetching
    private func fetchRestaurantInfo() {
        APIManager.getAllRestaurants { (response) in
            self.restaurants = response
            self.allRestaurantsTableView.reloadData()
        }
        
       APIManager.getMenuById(restaurantID: 0) { (response) in
            self.menu = self.filterMenu(theMenu: response)
        }
    }
    
    
    private func filterMenu(theMenu: [MenuItem]) -> [MenuSection]{
        var pizzas = [MenuItem]()
        var sides = [MenuItem]()
        var drinks = [MenuItem]()
        
        for item in theMenu {
            switch item.category {
            case "Pizzas":
                pizzas.append(item)
            case "Sides":
                sides.append(item)
            case "Drinks":
                drinks.append(item)
            default:
                break
            }
        }
        return [MenuSection(category: "🍕 Pizzas ", items: pizzas), MenuSection(category: "🥗 Sides", items: sides), MenuSection(category: "🥤 Drinks", items: drinks)]
    }
}
    

// MARK: - TableView Delegate

extension MainScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Restaurant Details View") as? RestaurantDetailsViewController{
            vc.menu = menu
            vc.currentRestaurant = restaurants[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

// MARK: - TableView DataSource

extension MainScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListTableViewCell", for: indexPath) as? RestaurantListTableViewCell {
            cell.restaurantNameLabel.text? = restaurants[indexPath.row].name
            cell.restaurantFirstAddressLabel.text? = "\(restaurants[indexPath.row].address1), \(restaurants[indexPath.row].address2)"
            
            if let distance = restaurants[indexPath.row].distanceTo {
                cell.restaurantSecondAddressLabel.text? = String(format: "%.1f", distance/1000) + "km"
            }
            return cell
        }
        return UITableViewCell()
    }
    
}







