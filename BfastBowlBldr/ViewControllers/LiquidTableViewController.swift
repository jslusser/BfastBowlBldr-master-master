//
//  LiquidTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//
// Branch test

import UIKit

class LiquidTableViewController: UITableViewController, CellProtocol {
    
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    
    let liquidImages = ["AlmondMilk.jpg",
    "Cashewmilk.jpg",
    "CoconutMilk.jpeg",
    "CoconutWater.jpg",
    "HempMilk.jpg",
    "FruitJuice.jpeg",
    "OatMilk.jpeg",
    "RiceMilk.jpeg",
    "Smoothie.jpeg",
    "Soymilk.jpg"]
    
    let liquidNames = ["Almond Milk",
    "Cashew Milk",
    "Coconut Milk",
    "Coconut Water",
    "Hemp Milk",
    "Juice - various",
    "Oat Milk",
    "Rice Milk",
    "Smoothie - various",
    "Soy Milk"]
    
    let liquidCopy = ["Almond Milk copy",
    "Cashew Milk copy",
    "Coconut Milk copy",
    "Coconut Water copy",
    "Hemp Milk copy",
    "Juice - various copy",
    "Oat Milk copy",
    "Rice Milk copy",
    "Smoothie - various copy",
    "Soy Milk copy"]
    
    let liquidInfo = ["https://en.wikipedia.org/wiki/Almond_milk",
    "http://www.cookinglight.com/eating-smart/smart-choices/what-is-cashew-milk",
    "https://en.wikipedia.org/wiki/Coconut_milk",
    "https://en.wikipedia.org/wiki/Coconut_water",
    "https://en.wikipedia.org/wiki/Hemp_milk",
    "https://en.wikipedia.org",
    "https://www.livestrong.com/article/267017-what-are-the-benefits-of-oat-milk/",
    "https://en.wikipedia.org/wiki/Rice_milk",
    "https://en.wikipedia.org",
    "https://en.wikipedia.org/wiki/Soy_milk"]
    
    let liquidPurch = ["https://www.amazon.com/Almond-Breeze-Unsweetened-Original-Ounce/dp/B01MQ0DRHH/ref=sr_1_14_s_it?rps=1&ie=UTF8&qid=1521755062&sr=1-14&keywords=organic+almond+milk&refinements=p_85%3A2470955011",
                       "https://www.amazon.com/SO-DELICIOUS-Organic-Beverage-Unsweetened/dp/B01B4LHETI/ref=sr_1_fkmr1_3?srs=7301146011&ie=UTF8&qid=1521755133&sr=8-3-fkmr1&keywords=organic+cashew+milk",
    "https://www.luckyvitamin.com/p-664901-so-delicious-dairy-free-cashew-milk-beverage-unsweetened-32-fl-oz?site=google_base&LanguageCode=EN&locale=en-US&utm_source=google&utm_medium=PLA&scid=scplp140905&sc_intid=140905&utmp_campaign=SC_Shopping_Campaign_CS25&branded=no&gclid=EAIaIQobChMIjc-K9fOA2gIVhrXACh10lga1EAQYAiABEgJeQ_D_BwE",
    "https://https://www.amazon.com/ZICO-Premium-Coconut-Water-Natural/dp/B014M6MK4G/ref=sr_1_3?srs=7301146011&ie=UTF8&qid=1521755255&sr=8-3&keywords=organic+coconut+water",
       "https://www.luckyvitamin.com/p-609057-pacific-foods-all-natural-hemp-milk-unsweetened-original-32-oz",
    "https://www.amazon.com",
    "https://www.amazon.com/Pacific-Foods-Non-Dairy-Beverage-Original/dp/B000R7829M/ref=sr_1_4_a_it?ie=UTF8&qid=1521910011&sr=8-4&keywords=oat+milk",
    "https://www.amazon.com/DREAM-Enriched-Original-Organic-Rice/dp/B000R79VR4/ref=sr_1_1?srs=7301146011&ie=UTF8&qid=1521755377&sr=8-1&keywords=organic+rice+milk",
    "https://www.amazon.com",
    "https://www.amazon.com/365-Everyday-Value-Organic-Original/dp/B074MFN7DG/ref=sr_1_2?srs=7301146011&ie=UTF8&qid=1521755406&sr=8-2&keywords=organic+soy+milk"]
    
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
  
    @IBAction func liquidSelected(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< liquidCopy.count {
            let newIngredient = Ingredient(name: liquidNames[i],
                                           imageString: liquidImages[i],
                                           copy: liquidCopy[i],
                                           info: liquidInfo[i],
                                           purchaseURL: liquidPurch[i],
                                           type: .liquid)
            ingredients.append(newIngredient)
        }
        
        let ingredientNib = UINib(nibName: "IngredientCell", bundle: nil)
        tableView.register(ingredientNib, forCellReuseIdentifier: "IngredientCell")
        tableView.estimatedRowHeight = 50
        
        
        // for inregedient in selectedIngredients {
        //   print(inregedient.name)
    }
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem


 override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
 }

// MARK: - Table view data source

override func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return liquidNames.count
}


override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
    let row = indexPath.row
    cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, setDelegate: self)
    return cell
}

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowLiquidDetails", sender: indexPath.row)
        
        
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
    
    if segue.identifier == "ShowLiquidDetails" {
        let detailViewController = segue.destination as! IngredientDetailViewController
        guard let row = sender as? Int else { fatalError("Unable to cast sender as Int")}
        
        detailViewController.ingredientDetailImages = liquidImages[row]
        detailViewController.ingredientAddlCopy = liquidCopy[row]
        detailViewController.ingredientMoreInfo = liquidInfo[row]
        detailViewController.ingredientPurchase = liquidPurch[row]
    }
    
    
    if segue.identifier == "SelectAddIn" {
        
     //   print (selectedIngredients)
        
        // You previously had the segue destination view controller being cast as the IngredientTableViewController instead of
        // LiquidTableViewController.
        let AddInTableViewController = segue.destination as! AddInTableViewController
        AddInTableViewController.selectedIngredients = selectedIngredients
        
    }
}

}



