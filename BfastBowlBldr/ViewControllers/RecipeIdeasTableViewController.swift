//
//  RecipeIdeasTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 4/2/18.
//  Copyright © 2018 James Slusser. All rights reserved.
//

import UIKit

class RecipeIdeasTableViewController: UITableViewController {
    let recipeImage = ["JimFav2.JPG",
                       "Jim2nd.jpeg",
                       "Red.JPG",
                       "Yellow.JPEG",
                       "Green.JPG",
                       "Blue.JPG"
    ]
    let recipeCopy = ["JIM'S FAVORITE BOWL;     1/2 cup (raw) Oatmeal, 2 tablespoons (raw) Buckwheat Groats, 1 cup Unsweetened (Plain) Almond Milk, 1/4 cup Coconut Water, 1/2 teaspoon Black Pepper, 1/2 teaspoon Cinnamon, 1/2 teaspoon Turmeric, 2 teaspoons Chia Seeds, 1/2 Apple medium diced, 1/2 Banana sliced, 1/4 cup Blueberries, 1 tablespoon Almonds (slivered), 1 teaspoon Honey, Juice of 1 Lemon, 1 tablespoon (Plain) Coconut Yogurt.  Note: Toss the Lemon Juice with the Apple and Banana to prevent browning",
                      "JIM'S 2ND FAVORITE BOWL;     Dessert for breakfast?  Yes please!  1/2 cup (raw) Oatmeal, 2 tablespoons (raw) Buckwheat Groats, 1 cup Unsweetened (Plain) Almond Milk, 1/4 cup Coconut Water, 2 tablespoons Cacao Powder, 1/2 teaspoon Cinnamon, 2 tablespoons Peanut Butter Powder, 1/2 tespoon Vanilla powder, 1/2 cup Cherries, 1 tablespoon Coconut (dried, shredded), 1 tablespoon Mint (sliced)",
                      "THE RED BOWL;     3/4 cup (cooked) Barley, 1 cup Hemp Milk, 1/4 cup Dates - Red (sliced), 2 teaspoons Ginger (chopped), 1/4 cup Goji Berries, 1 tablespoon Pomegranate seed, 1/4 cup Strawberries (sliced), 1/4 cup Raspberries, Zest of 1 Lime, 1 tablespoon Sunflower Seeds",
                      "THE YELLOW BOWL;     3/4 cup (cooked) Bulgur, 1 cup Rice Milk, 1/2 teaspoon Black Pepper, 2 teaspoon Turmeric, 1 Kiwi - yellow (sliced), 1/4 cup Mango (diced), 1/4 cup Pineapple (diced), Lemon Juice/zest, 1 tablespoon Brazil nuts (chopped)",
                      "THE GREEN BOWL;     3/4 cup (cooked) Cous Cous, 1 cup Oat Milk, 1 tablespoon Matcha or Moringa, 1 Kiwi - green (sliced), 1/2 cup Grapes - green (sliced), 1/2 cup Honeydew melon (diced), 1 tablespoon Hemp Seed, Zest and Juice of 1 Lime, 1 tablespoon Pumpkin Seed",
                      "THE BLUE BOWL;     3/4 cup (cooked) Quinoa, 1 cup Soy Milk, 1 tablespoon Chia Seeds, 1 Date - Medjool (sliced), 2 teaspoons Ginger (chopped), 1/4 cup Blackberries, 1/4 cup Blueberries, 1 tablespoon Walnuts (raw, chopped) , 1 tablespoon Mint (sliced), Zest and juice of 1 Lemon"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "recipeDetail", sender: indexPath.row)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail" {
            let detailViewController = segue.destination as! RecipeDetailViewController
            guard let row = sender as? Int else { fatalError("Unable to cast sender as Int")}
            detailViewController.recipeDetailImages = recipeImage[row]
            detailViewController.recipeAddlCopy = recipeCopy[row]
        }
    }
}
