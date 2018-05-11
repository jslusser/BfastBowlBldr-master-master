//
//  FruitTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class FruitTableViewController: UITableViewController, CellProtocol {
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    
    @IBAction func fruitSelected(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
        guard let url = Bundle.main.url(forResource: "fruit", withExtension: "json"),
            let fruitJSONData = try? Data(contentsOf: url),
            let ingredients = try? JSONDecoder().decode(Array<Ingredient>.self, from: fruitJSONData) else {
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
        performSegue(withIdentifier: "ShowFruitDetails", sender: indexPath.row)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "SelectTopping":
            guard selectedIngredients.contains(where: {$0.type == .fruit}) else {
                let alert = UIAlertController(title: NSLocalizedString("alertHeader", comment: ""), message: NSLocalizedString("fruitAlert", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alert, animated: true, completion: nil)
                return false
            }
        default:
            break
        }
        return true
    }
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell) {
        guard let indexPath = self.tableView.indexPath(for: myCell) else { return }
        print("cell at indexpath \(String(describing: indexPath)) tapped with switch status \(status)")
        let liquidSwitchSelected = myCell.label.text!
        print("Fruit added/removed was \(String(describing: liquidSwitchSelected))")
        if status {
            selectedIngredients.append(ingredients[indexPath.row])
        } else {
            guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
            selectedIngredients.remove(at: index)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFruitDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.ingredientDetailImages = ingredients[row].imageString
            detailViewController.ingredientAddlCopy = ingredients[row].copy
            detailViewController.ingredientMoreInfo = ingredients[row].info
            detailViewController.ingredientPurchase = ingredients[row].purchaseURL
        }
        if segue.identifier == "SelectTopping" {
            // print (selectedIngredients)
            let ToppingTableViewController = segue.destination as! ToppingTableViewController
            ToppingTableViewController.selectedIngredients = selectedIngredients
        }
    }
}
