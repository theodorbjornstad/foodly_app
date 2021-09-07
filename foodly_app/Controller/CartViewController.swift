//
//  CartViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 31/08/2021.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    
    fileprivate var currentCart: Cart?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
        self.registerTableViewCells()
        self.navigationItem.backButtonTitle = " "
        currentCart = CartManager.shared.getCart()
        
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: CheckoutTableViewCell.identifier, bundle: nil)
        self.cartTableView.register(textFieldCell, forCellReuseIdentifier: CheckoutTableViewCell.identifier)

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
        return CartManager.shared.getCart().cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartItem = currentCart?.cartItems[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTableViewCell.identifier, for: indexPath) as? CheckoutTableViewCell else {
            return UITableViewCell()
        }
        cell.itemNameLabel.text = "\(cartItem!.menuItem.name)"
        cell.itemPriceLabel.text = "\(cartItem!.getTotalPrice()) kr" // total price
        cell.quanityLabel.text = "\(cartItem?.getQuantity() ?? 0)" // String(cartItem?.getQuantity())
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    
}


