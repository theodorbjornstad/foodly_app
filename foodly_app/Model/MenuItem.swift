//
//  Menu.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 30/08/2021.
//

import Foundation

struct MenuItem: Decodable {
    let id: Int
    let category, name: String
    let topping: [String]?
    let price: Int?
    let rank: Int?
}
