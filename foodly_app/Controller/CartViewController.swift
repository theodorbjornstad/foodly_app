//
//  CartViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 31/08/2021.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    
    var currentCart: Cart?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
        self.registerTableViewCells()
        self.navigationItem.backButtonTitle = " "
        currentCart = CartManager.shared.getCart()
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "MenuTableViewCell", bundle: nil)
        let textFieldCell2 = UINib(nibName: "RestaurantListTableViewCell", bundle: nil)
        self.cartTableView.register(textFieldCell, forCellReuseIdentifier: "MenuTableViewCell")
        self.cartTableView.register(textFieldCell2, forCellReuseIdentifier: "RestaurantListTableViewCell")
    }
    
    
    
    
}

// MARK: - TableView Delegate

extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CartManager.shared.removeFromCart(index: indexPath.row)
        //cartTableView.reloadData()
    }
    
    
}


// MARK: - TableView DataSource

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.getCart().menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = currentCart?.menuItems[indexPath.row]
        
        if item?.category == "Pizzas"{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListTableViewCell", for: indexPath) as? RestaurantListTableViewCell else {
                return UITableViewCell()
            }
            cell.restaurantNameLabel.text = item?.name
            cell.restaurantFirstAddressLabel.text = "\(item!.price!)kr"
            cell.restaurantSecondAddressLabel.text = item?.topping?.joined(separator: ", ")
            cell.restaurantSecondAddressLabel.adjustsFontSizeToFitWidth = true
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else {
                return UITableViewCell()
            }
            cell.itemName.text? = item!.name
            
            if item!.price == 0{
                cell.itemPrice.text = "Free"
            } else {
                cell.itemPrice.text = "\(item!.price!)kr"
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartTableView.beginUpdates()
            CartManager.shared.removeFromCart(index: indexPath.row)
            cartTableView.deleteRows(at: [indexPath], with: .fade)
            cartTableView.endUpdates()
        }
    }
}


