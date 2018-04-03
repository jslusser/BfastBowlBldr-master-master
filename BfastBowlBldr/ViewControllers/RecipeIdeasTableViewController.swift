//
//  RecipeIdeasTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 4/2/18.
//  Copyright © 2018 James Slusser. All rights reserved.
//

import UIKit

class RecipeIdeasTableViewController: UITableViewController {

    let recipeImage = ["JimFav.JPG",
                       "Red.JPG",
                       "Yellow.JPG",
                       "Green.JPG",
                       "Blue.JPG",
                       ]
    
    let recipeCopy = ["Oatmeal, Buckwheat Groats, Almond Milk, Coconut Water, Black Pepper, Cinnamon, Turmeric, Chia Seeds, Banana, Blueberries, Hemp Seed, Honey, Lemon Juice",
                      "Barley, Hemp Milk, Dates - Red, Goji Berries, Strawberries, Raspberries, Walnuts",
                      "Bulgur, Rice Milk, Yellow copy, Black Pepper, Kiwi - yellow, Turmeric, Pineapple, Lemon Juice/zest, Wheat Germ",
                      "Cous Cous, Oat Milk, Matcha or Moringa, Kiwi - green, Grapes - green, Honeydew melon, Lime juice/zest, Pumpkin Seed",
                      "Quinoa, Soy Milk, Dates - Medjool, Blackberries, Blueberries, Brazil Nut, Lemon juice/zest",
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
