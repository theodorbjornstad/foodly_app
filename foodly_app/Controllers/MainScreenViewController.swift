//
//  ViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 24/08/2021.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var allRestaurantsTableView: UITableView!
    
    let restaurants = [
        "Peppes pizza",
        "Dolly dimples",
        "McDonalds",
        "Burger King"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        allRestaurantsTableView.delegate = self
        allRestaurantsTableView.dataSource = self
        self.registerTableViewCells()
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Tap registered")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListTableViewCell", for: indexPath) as? RestaurantListTableViewCell {
            cell.restaurantNameLabel.text? = restaurants[indexPath.row]
            cell.restaurantFirstAddressLabel.text? = "Scheelegatan 15"
            cell.restaurantSecondAddressLabel.text? = "112 28 Stockholm"
            cell.restaurantView.layer.cornerRadius = 10 // cell.restaurantView.frame.height / 2
            
            
            return cell
        }
        
    
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "RestaurantListTableViewCell", bundle: nil)
        self.allRestaurantsTableView.register(textFieldCell, forCellReuseIdentifier: "RestaurantListTableViewCell")
        
    }
    
}






