//
//  ViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 24/08/2021.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var allRestaurantsTableView: UITableView!
    
    var restaurants = [] as [Restaurant]
    var menu = [] as [MenuSection]
    static var cart = [] as [MenuItem]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        allRestaurantsTableView.delegate = self
        allRestaurantsTableView.dataSource = self
        self.registerTableViewCells()
        self.navigationItem.backButtonTitle = " "
        fetchRestaurantInfo()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Restaurant Details View") as? RestaurantDetailsViewController{
            vc.menu = menu
            vc.currentRestaurant = restaurants[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListTableViewCell", for: indexPath) as? RestaurantListTableViewCell {
            cell.restaurantNameLabel.text? = restaurants[indexPath.row].name
            cell.restaurantFirstAddressLabel.text? = restaurants[indexPath.row].address1
            cell.restaurantSecondAddressLabel.text? = restaurants[indexPath.row].address2
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
    
    
    private func fetchRestaurantInfo() {
        APIManager.getAllRestaurants { (response) in
            self.restaurants = response
            self.allRestaurantsTableView.reloadData()
        }
        
       APIManager.getMenuById(restaurantID: 0) { (response) in
            self.menu = self.filterMenu(theMenu: response)
            print(self.menu)
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
    
    






