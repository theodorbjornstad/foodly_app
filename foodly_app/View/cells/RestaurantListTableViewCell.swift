//
//  RestaurantListTableViewCell.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 30/08/2021.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantFirstAddressLabel: UILabel!
    @IBOutlet weak var restaurantSecondAddressLabel: UILabel!
    @IBOutlet weak var restaurantView: UIView!
    
    
    
    static let identifier = "RestaurantListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        restaurantView.layer.cornerRadius = 10
        restaurantNameLabel.font = UIFont(name: "Nexa-Trial-Bold", size: 17)
        restaurantFirstAddressLabel.font = UIFont(name: "Nexa-Trial-LightItalic", size: 15)
        restaurantSecondAddressLabel.font = UIFont(name: "Nexa-Trial-Book", size: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
