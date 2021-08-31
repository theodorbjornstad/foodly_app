//
//  RestaurantDetailsViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 30/08/2021.
//

import UIKit

class RestaurantDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var currentRestaurant: Restaurant?
    var menu = [MenuSection]()
    
    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.registerTableViewCells()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = menu[indexPath.section].items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        cell.itemName.text? = item.name
        cell.itemPrice.text = "\(item.price!)kr"
        return cell
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "MenuTableViewCell", bundle: nil)
        self.menuTableView.register(textFieldCell, forCellReuseIdentifier: "MenuTableViewCell")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menu[section].category
    }
    
    
    
    
    

}
