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
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Tap registered")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Restaurant Cell ", for: indexPath)
        cell.textLabel?.text = restaurants[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
}






