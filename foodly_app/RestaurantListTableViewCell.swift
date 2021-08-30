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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
