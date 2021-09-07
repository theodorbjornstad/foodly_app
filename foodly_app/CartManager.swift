//
//  CartManager.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 31/08/2021.
//

import Foundation

class CartManager {
    
    static let shared = CartManager()
    var cart = Cart(cartItems: [CartItem]())
    
    func getCart() -> Cart {
        return cart
    }
    
    func addToCart(chosenMenuItem: MenuItem) {
        if let i = cart.cartItems.firstIndex(where: { $0.menuItem.id == chosenMenuItem.id }) {
            cart.cartItems[i].incrementQuantity()
        } else {
            cart.cartItems.append(CartItem(item: chosenMenuItem))
        }
        
        print(cart)
    }
    
    func removeFromCart(index: Int) {
        if(index < cart.cartItems.count) {
            
            if(cart.cartItems[index].getQuantity() == 1) {
                cart.cartItems.remove(at: index)
            } else {
                cart.cartItems[index].decrementQuantity()
            }
        }
    }
}
