//
//  CartManager.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 31/08/2021.
//

import Foundation

class CartManager {
    
    static let shared = CartManager()
    var cart = Cart(menuItems: [MenuItem]())
    
    func getCart() -> Cart {
        return cart
    }
    
    func addToCart(menuItem: MenuItem) {
        cart.menuItems.append(menuItem)
    }
    
    func removeFromCart(index: Int) {
        if(index < cart.menuItems.count) {
            cart.menuItems.remove(at: index)
        }
    }
}
