//
//  CartBottomViewViewController.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 07/09/2021.
//

import UIKit

class CartBottomViewViewController: UIViewController {

    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var itemsTextLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    fileprivate var currentCart: Cart?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 25
        checkoutButton.layer.cornerRadius = 25
        currentCart = CartManager.shared.getCart()
        setValues()
        self.navigationItem.backButtonTitle = " "
    }
    
    
    private func setValues() {
        var totalItems = 0
        var totalCost = 0
        
        if let allItems = currentCart?.cartItems {
            for item in allItems {
                totalItems += item.getQuantity()
                totalCost += item.getTotalPrice()
            }
        }
        
        if totalItems == 0 {
            totalTextLabel.text = "Total: 0kr"
            itemsTextLabel.text = "0 Items"
        } else {
            totalTextLabel.text = "Total: \(totalCost)kr"
            itemsTextLabel.text = "Items: \(totalItems)"
        }
    }
}
