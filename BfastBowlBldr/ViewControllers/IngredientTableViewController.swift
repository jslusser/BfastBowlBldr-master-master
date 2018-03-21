//
//  IngredientTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/14/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//
// GitHub test within Xcode

import UIKit

class IngredientTableViewController: UITableViewController, CellProtocol {
    
    // MARK:- This ingredient array is for the tableView data
    var ingredients = [Ingredient]()
    
    // MARK:- This ingredient array is for the user selected ingredients
    var selectedIngredients = [Ingredient]()
    
    // MARK:- Since you're not loading the information for the arrays from a file or outside source, you can declare and initialize the information arrays in the class definition. I also changed them to constants since you don't want to accidentally alter the data they contain elsewhere.
    
    let grainImages = ["Barley.jpg",
                       "Buckwheat.jpg",
                       "Bulgur.jpg",
                       "Couscous.jpg",
                       "Oatmeal.jpg",
                       "Quinoa.jpg",
                       "icon.jpg"]
    
    let grainNames = ["Barley",
                      "Buckwheat Groats",
                      "Bulgur",
                      "Cous Cous (Pearl)",
                      "Oatmeal",
                      "Quinoa",
                      "Rice"]
    
    let grainCopy = ["Pearled Barley - one of the first grains ever cultivated - is a nice one to try if you haven't cooked with it recently.  Do use it cooked.",
                     "I like to include 1 Tablespoon or more of Buckwheat Groats with whatever other grain I select, as I find it retains it's crunchy texture and is a nice contrast to my usual Oatmeal, or a cooked grain.  I simply toss them in raw - no cooking required.",
                     "Bulgur Wheat is also a good choice if you need a change.  Do cook it in advance - it couldn't be any easier to make - and I love the Nutty flavor and it couldn't be any easier to make.",
                     "I like the larger Pearl (or Israeli) Cous Cous for a change of pace.  I usually opt for the whole wheat version, but any will do.  Use it cooked, and if you are making some other Cous Cous dish, set aside a bit for your Breakfast Bowl experimentation.",
                     "Oatmeal is my go-to grain of choice.  I use it raw, as the overnight soaking does the trick.  There are several varieties to choose from (traditional, steel cut, fast-cooking), so experiment and find a brand and style that works for you",
                     "Quinoa is another go-to grain choice for me.  If I cook a big batch on a Sunday, I'll set aside some to use in bowls during the week.",
                     "There are so many varieties of Rice to choose from that you just need to start with one and work your way through all of the choices.  Brown and Black are my current favorites.  If you like this, you should check out Congee for another breakfast (or any meal!) treat."]
    
    
    let grainInfo = ["https://draxe.com/barley-nutrition/",
                     "https://draxe.com/buckwheat-nutrition/",
                     "https://draxe.com/bulgur-wheat/",
                     "https://en.wikipedia.org",
                     "https://en.wikipedia.org",
                     "https://en.wikipedia.org",
                     "https://en.wikipedia.org",]
    
    let grainPurch = ["https://www.amazon.com/Bobs-Red-Mill-Pearl-Barley/dp/B004T33Y8O/ref=sr_1_6_a_it?th=1",
                      "https://www.amazon.com/Arrowhead-Mills-Organic-Buckwheat-Groats/dp/B00X2SEAXA/ref=sr_1_1_s_it",
                      "https://www.amazon.com/Bobs-Red-Mill-Bulgur-Wheat/dp/B0013JK0KM/ref=sr_1_3_s_it",
                      "https://www.amazon.com",
                      "https://www.amazon.com",
                      "https://www.amazon.com",
                      "https://www.amazon.com"]
    
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell) {
        
        // using guard let syntax to unwrap the optional; if it returns nil then it exits the function and does nothing
        guard let indexPath = self.tableView.indexPath(for: myCell) else { return }
        print("cell at indexpath \(String(describing: indexPath)) tapped with switch status \(status)")
        
        // Changed the print statement to make more sense in this context
        let grainSwitchSelected = myCell.label.text!
        print("Grain added/removed was \(String(describing: grainSwitchSelected))")
        
        // MARK: - This code block adds or removes selected ingredients based on the status of the switch.
        if status {
            selectedIngredients.append(ingredients[indexPath.row])
        } else {
            // MARK: - This logic is here in the event that a given ingredient isn't in the selected ingredients array
            /*
             You probably haven't had much exposure to closures so this may look a bit confusing, so I'll do a little explaining:
             The function selectedIngredients.index(where:) returns the position of an element in the selectedIngredients array.
             It takes a closure as it's parameter to dermine how to find the position of the element you are looking for. Since
             this is being performed on an array, essentially what is doing under the hood is performing a for-in loop and
             checking that there is an ingredient in the array that matches the name of the ingredient in the row selected.
             So in a for-in loop you might have syntax like this: for ingredient in selectedIngredients { do something }. In
             that context, you use the variable ingredient to access any value in the array and perform any actions you need
             to on it. Well, in the closure here, $0 is used as a substitute for a variable declared for a for-in loop. So in this
             case, selectedIngredients.index(where:) is checking that ingredient ($0) at the position it currently is looping
             through matches the name of the ingredient at the row switch that was selected.
             */
            guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
            selectedIngredients.remove(at: index)
        }
    }
    
    
    @IBAction func grainSelected(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - The for loop needs to be executed **after** you assign values to the arrays.
        
        for i in 0 ..< grainCopy.count {
            let newIngredient = Ingredient(name: grainNames[i],
                                           imageString: grainImages[i],
                                           copy: grainCopy[i],
                                           info: grainInfo[i],
                                           purchaseURL: grainPurch[i],
                                           type: .grain)
            ingredients.append(newIngredient)
        }
        let ingredientNib = UINib(nibName: "IngredientCell", bundle: nil)
        tableView.register(ingredientNib, forCellReuseIdentifier: "IngredientCell")
        tableView.estimatedRowHeight = 50
        
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
        return grainNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        
        let row = indexPath.row
        cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, setDelegate: self)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowGrainDetails", sender: indexPath.row)
        
    }
    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowGrainDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            guard let row = sender as? Int else { fatalError("Unable to cast sender as Int")}
            
            detailViewController.ingredientDetailImages = grainImages[row]
            detailViewController.ingredientAddlCopy = grainCopy[row]
            detailViewController.ingredientMoreInfo = grainInfo[row]
            detailViewController.ingredientPurchase = grainPurch[row]
        }
        
        if segue.identifier == "SelectLiquid" {
            
          //  print (selectedIngredients)
            
            let LiquidTableViewController = segue.destination as! LiquidTableViewController
            LiquidTableViewController.selectedIngredients = selectedIngredients
            
        }
    }
    
    
}

