//
//  IngredientCellTableViewCell.swift
//  BfastBowlBldr
//
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
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(textForLabel: String, image: String, isSelected: Bool, setDelegate: CellProtocol) {
        label.text = textForLabel
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        ingredientImage.image = UIImage(named: image)
        ingredientSwitch.isOn = isSelected
        delegate = setDelegate
    }
    @IBAction func switchTapped(_ sender: UISwitch) {
        self.delegate?.switchButtonTapped(WithStatus: sender.isOn, ForCell: self)
    }
}

protocol CellProtocol: class {
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell)
}
