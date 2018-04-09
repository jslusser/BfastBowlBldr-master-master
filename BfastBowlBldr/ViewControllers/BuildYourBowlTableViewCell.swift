//
//  BuildYourBowlTableViewCell.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 3/21/18.
//  Copyright © 2018 James Slusser. All rights reserved.
//

import UIKit

class BuildYourBowlTableViewCell: UITableViewCell {

    @IBOutlet weak var bowlImages: UIImageView!
    @IBOutlet weak var bowlNames: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
