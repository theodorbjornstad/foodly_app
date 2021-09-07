//
//  CheckoutTableViewCell.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 07/09/2021.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {

    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var quanityLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemView: UIView!
    
    static let identifier = "CheckoutTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
