//
//  IngredientTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/14/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController, CellProtocol {
    // MARK: This ingredient array is for the tableView data
    var ingredients = [Ingredient]()
    // MARK: This ingredient array is for the user selected ingredients
    var selectedIngredients = [Ingredient]()
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell) {
        // using guard let syntax to unwrap the optional; if it returns nil then it exits the function and does nothing
        guard let indexPath = self.tableView.indexPath(for: myCell) else { return }
        print("cell at indexpath \(String(describing: indexPath)) tapped with switch status \(status)")
        let grainSwitchSelected = myCell.label.text!
        print("Grain added/removed was \(String(describing: grainSwitchSelected))")
        // MARK: - This code block adds or removes selected ingredients based on the status of the switch.
        if status {
            selectedIngredients.append(ingredients[indexPath.row])
        } else {
            // MARK: - This logic is here in the event that a given ingredient isn't in the selected ingredients array
            guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
            selectedIngredients.remove(at: index)
        }
    }
    @IBAction func grainSelected(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = Bundle.main.url(forResource: "Grain", withExtension: "json"),
            let grainJSONData = try? Data(contentsOf: url),
            let ingredients = try? JSONDecoder().decode(Array<Ingredient>.self, from: grainJSONData) else {
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
        performSegue(withIdentifier: "ShowGrainDetails", sender: indexPath.row)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "SelectLiquid":
            guard selectedIngredients.contains(where: {$0.type == .grain}) else {
                let alert = UIAlertController(title: "Bowl Builder Tip", message: "Please select at least one Grain before continuing", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alert, animated: true, completion: nil)
                return false
            }
        default:
            break
        }
        return true
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowGrainDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            guard let row = sender as? Int else { fatalError("Unable to cast sender as Int")}
            detailViewController.ingredientDetailImages = ingredients[row].imageString
            detailViewController.ingredientAddlCopy = ingredients[row].copy
            detailViewController.ingredientMoreInfo = ingredients[row].info
            detailViewController.ingredientPurchase = ingredients[row].purchaseURL
        }
        if segue.identifier == "SelectLiquid" {
            //  print (selectedIngredients)
            let LiquidTableViewController = segue.destination as! LiquidTableViewController
            LiquidTableViewController.selectedIngredients = selectedIngredients
        }
    }
}
