//
//  SideMenuTableViewCell.swift
//  trilhas
//
//  Created by Eric Bunese on 20/08/17.
//  Copyright © 2017 Eric Bunese. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

  //Mark: Properties
  @IBOutlet weak var optionLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
