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
                       "Red.JPG",
                       "Yellow.JPG",
                       "Green.JPG",
                       "Blue.JPG",
                       ]
    
    let recipeCopy = ["JIM'S FAVORITE BOWL;     1/2 cup (raw) Oatmeal, 2 tablespoons (raw) Buckwheat Groats, 1 cup Unsweetened (Plain) Almond Milk, 1/4 cup Coconut Water, 1/2 teaspoon Black Pepper, 1/2 teaspoon Cinnamon, 1/2 teaspoon Turmeric, 2 teaspoons Chia Seeds, 1/2 Apple medium diced, 1/2 Banana sliced, 1/4 cup Blueberries, 1 tablespoon Almonds (slivered), 1 teaspoon Honey, Juice of 1 Lemon, 1 tablespoon (Plain) Coconut Yogurt.  Note: Toss the Lemon Juice with the Apple and Banana to prevent browning",
                      "THE RED BOWL;     3/4 cup (cooked) Barley, 1 cup Hemp Milk, 1/4 cup Dates - Red (sliced), 1/4 cup Goji Berries, 1 tablespoon Pomegranate seed, 1/4 cup Strawberries (sliced), 1/4 cup Raspberries, Zest of 1 Lime, 1 tablespoon Walnuts",
                      "THE YELLOW BOWL;     3/4 cup (cooked) Bulgur, 1 cup Rice Milk, 1/2 teaspoon Black Pepper, 1 Kiwi - yellow (sliced), 2 teaspoon Turmeric, 1/4 cup Pineapple (diced), Lemon Juice/zest, 1 tablespoon Wheat Germ",
                      "THE GREEN BOWL;     3/4 cup (cooked) Cous Cous, 1 cup Oat Milk, 1 tablespoon Matcha or Moringa, 1 Kiwi - green (sliced), 1/2 cup Grapes - green (sliced), 1/2 cup Honeydew melon (diced), 1 tablespoon Hemp Seed, Zest and Juice of 1 Lime, 1 tablespoon Pumpkin Seed",
                      "THE BLUE BOWL;     3/4 cup (cooked) Quinoa, 1 cup Soy Milk, 2 Dates - Medjool (sliced), 1/4 cup Blackberries, 1/4 cup Blueberries, 1 tablespoon Brazil Nut (chopped) , 1 Lemon juice/zest",
                      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "recipeDetail", sender: indexPath.row)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail" {
            let detailViewController = segue.destination as! RecipeDetailViewController
            guard let row = sender as? Int else { fatalError("Unable to cast sender as Int")}
            
            detailViewController.recipeDetailImages = recipeImage[row]
            detailViewController.recipeAddlCopy = recipeCopy[row]
            
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
