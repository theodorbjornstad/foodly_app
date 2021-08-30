//
//  Restaurant.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 30/08/2021.
//

import Foundation

struct Restaurant: Decodable {
    let id: Int
    let name, address1, address2: String
    let latitude, longitude: Double
}

//typealias Restaurants = [Restaurant]

