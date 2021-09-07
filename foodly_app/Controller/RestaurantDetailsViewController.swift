//
//  RestaurantDetailsViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 30/08/2021.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
   
    var currentRestaurant: Restaurant?
    var menu = [MenuSection]()
    
    @IBOutlet weak var menuTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.registerTableViewCells()
        self.navigationItem.title = currentRestaurant?.name
    }
    
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "MenuTableViewCell", bundle: nil)
        let textFieldCell2 = UINib(nibName: "RestaurantListTableViewCell", bundle: nil)
        self.menuTableView.register(textFieldCell, forCellReuseIdentifier: "MenuTableViewCell")
        self.menuTableView.register(textFieldCell2, forCellReuseIdentifier: "RestaurantListTableViewCell")
    }
    
    
    
    
    
}

// MARK: - TableView Delegate

extension RestaurantDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = menu[indexPath.section].items[indexPath.row]
        CartManager.shared.addToCart(chosenMenuItem: item)
    }
}

// MARK: - TableView DataSource

extension RestaurantDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = menu[indexPath.section].items[indexPath.row]
        
        if item.category == "Pizzas"{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantListTableViewCell.identifier, for: indexPath) as? RestaurantListTableViewCell else {
                return UITableViewCell()
            }
            cell.restaurantNameLabel.text = item.name
            cell.restaurantFirstAddressLabel.text = "\(item.price!)kr"
            cell.restaurantSecondAddressLabel.text = item.topping?.joined(separator: ", ")
            cell.restaurantSecondAddressLabel.adjustsFontSizeToFitWidth = true
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else {
                return UITableViewCell()
            }
            cell.itemName.text? = item.name
            
            if item.price == 0 {
                cell.itemPrice.text = "Free"
            } else {
                cell.itemPrice.text = "\(item.price!)kr"
            }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menu[section].category
    }
    
}
