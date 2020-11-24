//
//  DeviceTypeTableViewCell.swift
//  ShopDetails
//
//  Created by developer on 23/11/20.
//  Copyright © 2020 blockchain. All rights reserved.
//

import UIKit

class DeviceTypeTableViewCell: UITableViewCell {
  
    @IBOutlet var shopNameLbl : UILabel!
    @IBOutlet var shopAddressLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
