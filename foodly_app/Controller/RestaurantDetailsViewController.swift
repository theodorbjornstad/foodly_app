//
//  RestaurantDetailsViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 30/08/2021.
//

import UIKit

class RestaurantDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var currentRestaurant: Restaurant?
    var menu = [] as [MenuItem]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantId = currentRestaurant?.id {
            APIManager.getMenuById(restaurantID: restaurantId) { (response) in
                //self.menu = response
                self.responseToSections(response: response)
                print(self.menu)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // implement
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // implement
        return UITableViewCell()
    }
    
    private func responseToSections(response: [MenuItem]) {
        // implement sorting function that sorts response into categories?        
    }
    

}
