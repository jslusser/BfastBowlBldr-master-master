//
//  EquipmentTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class EquipmentTableViewController: UITableViewController, CellProtocol {
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "equipment", withExtension: "json"),
            let equipmentJSONData = try? Data(contentsOf: url),
            let ingredients = try? JSONDecoder().decode(Array<Ingredient>.self, from: equipmentJSONData) else {
                print("Error loading JSON")
                fatalError()
        }
        print(ingredients)
        self.ingredients = ingredients
        let ingredientNib = UINib(nibName: "IngredientCell", bundle: nil)
        tableView.register(ingredientNib, forCellReuseIdentifier: "IngredientCell")
        tableView.estimatedRowHeight = 50
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        let row = indexPath.row        
        cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, isSelected: selectedIngredients.contains {$0.name == ingredients[row].name}, setDelegate: self)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowEquipmentDetails", sender: indexPath.row)
    }
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell) {
        guard let indexPath = self.tableView.indexPath(for: myCell) else { return }
        print("cell at indexpath \(String(describing: indexPath)) tapped with switch status \(status)")
        let liquidSwitchSelected = myCell.label.text!
        print("Liquid added/removed was \(String(describing: liquidSwitchSelected))")
        if status {
            selectedIngredients.append(ingredients[indexPath.row])
        } else {
            guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
            selectedIngredients.remove(at: index)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEquipmentDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.ingredientDetailImages = ingredients[row].imageString
            detailViewController.ingredientAddlCopy = ingredients[row].copy
            detailViewController.ingredientMoreInfo = ingredients[row].info
            detailViewController.ingredientPurchase = ingredients[row].purchaseURL
        }
    }
}
