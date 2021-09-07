//
//  CartItem.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 07/09/2021.
//

import Foundation


struct CartItem {
    let menuItem: MenuItem
    private var quantity: Int // TODO: Make private?
    
    init(item: MenuItem) {
        self.menuItem = item
        self.quantity = 1
    }
    
    func getTotalPrice() -> Int {
        return menuItem.price! * quantity
    }
    
    func getQuantity() -> Int {
        return self.quantity
    }
    
    mutating func incrementQuantity() {
        self.quantity = self.quantity + 1
    }
    
    mutating func decrementQuantity() {
        self.quantity = self.quantity - 1
    }
}
