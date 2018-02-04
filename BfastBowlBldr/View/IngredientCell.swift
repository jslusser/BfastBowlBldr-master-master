//
//  IngredientCellTableViewCell.swift
//  BfastBowlBldr
//
//  Created by Steven Sherry on 10/10/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell {

    @IBOutlet weak var ingredientImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ingredientSwitch: UISwitch!
    
    weak var delegate: CellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(textForLabel: String, image: String, setDelegate: CellProtocol) {
        label.text = textForLabel
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        ingredientImage.image = UIImage(named: image)
        delegate = setDelegate
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        self.delegate?.switchButtonTapped(WithStatus: sender.isOn, ForCell: self)
    }
}

protocol CellProtocol: class {
    func switchButtonTapped(WithStatus status: Bool , ForCell myCell: IngredientCell)
}
