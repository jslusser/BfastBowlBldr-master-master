//
//  RecipeIdeasTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 4/2/18.
//  Copyright © 2018 James Slusser. All rights reserved.
//

import UIKit

class RecipeIdeasTableViewController: UITableViewController {
    // MARK: This ingredient array is for the tableView data
    var ingredients = [Ingredient]()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = Bundle.main.url(forResource: "recipe", withExtension: "json"),
            let recipeJSONData = try? Data(contentsOf: url),
            let ingredients = try? JSONDecoder().decode(Array<Ingredient>.self, from: recipeJSONData) else {
                print("Error loading JSON")
                fatalError()
        }
        print(ingredients)
        self.ingredients = ingredients
        //  let ingredientNib = UINib(nibName: "IngredientCell", bundle: nil)
        //  tableView.register(ingredientNib, forCellReuseIdentifier: "IngredientCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = ingredients[row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "recipeDetail", sender: indexPath.row)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail" {
            let detailViewController = segue.destination as! RecipeDetailViewController
            guard let row = sender as? Int else { fatalError("Unable to cast sender as Int")}
            detailViewController.recipeDetailImages = ingredients[row].imageString
            detailViewController.recipeAddlCopy = ingredients[row].copy
        }
    }
}
