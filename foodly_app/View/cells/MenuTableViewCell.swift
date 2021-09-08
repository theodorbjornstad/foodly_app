//
//  MenuTableViewCell.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 31/08/2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    
  
    @IBOutlet weak var menuItemView: UIView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuItemView.layer.cornerRadius = 10
        
        itemName.font = UIFont(name: "Nexa-Trial-Bold", size: 17)
        itemPrice.font = UIFont(name: "Nexa-Trial-Book", size: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
