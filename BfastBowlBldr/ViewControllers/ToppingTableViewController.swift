//
//  ToppingTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class ToppingTableViewController: UITableViewController, CellProtocol {
    
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    
    var toppingImages = [String]()
    var toppingNames = [String]()
    var toppingCopy = [String]()
    var toppingInfo = [String]()
    var toppingPurch = [String]()

    @IBAction func toppingSelected(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toppingImages = ["Brazil.jpg",
                         "Hempseed.jpg",
                         "icon.jpg",
                         "Pumpkin.jpg",
                         "Sunflower.jpg",
                         "Walnut.jpg",
                         "Wheatgerm.jpg",
                         "icon.jpg"
        ]
        
        toppingNames = ["Brazil Nut",
                        "Hemp Seed",
                        "Honey",
                        "Pumpkin Seed",
                        "Sunflower Seed",
                        "Walnuts",
                        "Wheat Germ",
                        "Yogurt - Coconut"
        ]
        
        toppingCopy = ["Brazil Nut copy",
                       "Hemp Seed copy",
                       "Honey copy",
                       "Pumpkin Seed copy",
                       "Sunflower Seed copy",
                       "Walnut copy",
                       "Wheat Germ copy",
                       "Yogurt - Coconut copy"
        ]
        
        toppingInfo = ["https://en.wikipedia.org/wiki/Brazil_nut",
                       "https://www.healthline.com/nutrition/6-health-benefits-of-hemp-seeds",
                       "https://en.wikipedia.org/wiki/Honey",
                       "https://en.wikipedia.org/wiki/Pumpkin_seed",
                       "https://en.wikipedia.org/wiki/Sunflower_seed",
                       "https://en.wikipedia.org/wiki/Walnut",
                       "https://www.healthline.com/health/wheat-germ-benefits#modal-close",
                       "https://www.myorganiclife.info/coconut-yoghurt/"
        ]
        
        toppingPurch = ["https://www.amazon.com/NOW-Foods-Brazil-Nuts-12-Ounce/dp/B000ZL1WQU/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521756462&sr=1-4&keywords=brazil+nut",
                        "https://www.amazon.com/Nutiva-Hempseed-Sustainably-Canadian-19-Ounces/dp/B00B42KQ8O/ref=sr_1_5_s_it?s=grocery&ie=UTF8&qid=1521756483&sr=1-5&keywords=hemp%2Bseed&th=1",
                        "https://www.amazon.com/Nature-Nates-Ounce-Organic-Unfiltered/dp/B01IR6IZZA/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521756508&sr=1-4&keywords=organic+honey",
                        "https://www.amazon.com/Terrasoul-Superfoods-Organic-Pumpkin-Pounds/dp/B01BLYNWVM/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521756532&sr=1-4&keywords=pumpkin+seed",
                        "https://www.amazon.com/Terrasoul-Superfoods-Organic-Hulled-Sunflower/dp/B00SRMA4U4/ref=sr_1_5_s_it?s=grocery&ie=UTF8&qid=1521756599&sr=1-5&keywords=sunflower+seed",
                        "https://www.amazon.com/Three-Pounds-Walnuts-Shelled-Pieces/dp/B00IED712U/ref=sr_1_15_s_it?s=grocery&ie=UTF8&qid=1521756619&sr=1-15&keywords=walnut",
                        "https://www.amazon.com/Grain-natural-Untoasted-Packaged-Resealable/dp/B01BNU7XPA/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521756646&sr=1-4&keywords=wheat+germ",
                        "https://www.noosayoghurt.com/product/coconut/?gclid=EAIaIQobChMIxqPaxPmA2gIVnI2zCh0i5wLdEAAYASAAEgIAfvD_BwE"
        ]
        
        for i in 0 ..< toppingCopy.count {
            let newIngredient = Ingredient(name: toppingNames[i],
                                           imageString: toppingImages[i],
                                           copy: toppingCopy[i],
                                           info: toppingInfo[i],
                                           purchaseURL: toppingPurch[i],
                                           type: .topping)
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
        return toppingNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        
        let row = indexPath.row
        cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, setDelegate: self)
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowToppingDetails", sender: indexPath.row)
        
        
    }
    
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell) {
        
        guard let indexPath = self.tableView.indexPath(for: myCell) else { return }
        print("cell at indexpath \(String(describing: indexPath)) tapped with switch status \(status)")
        
        let liquidSwitchSelected = myCell.label.text!
        print("Topping added/removed was \(String(describing: liquidSwitchSelected))")
        
        if status {
            selectedIngredients.append(ingredients[indexPath.row])
        } else {
            
            guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
            selectedIngredients.remove(at: index)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowToppingDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.ingredientDetailImages = toppingImages[row]
            detailViewController.ingredientAddlCopy = toppingCopy[row]
            detailViewController.ingredientMoreInfo = toppingInfo[row]
            detailViewController.ingredientPurchase = toppingPurch[row]
        }
        
       if segue.identifier == "BuildBowl" {
        
         print (selectedIngredients)
        
            let BYBTableViewController = segue.destination as! BYBTableViewController
            BYBTableViewController.selectedIngredients = selectedIngredients
        }
        
    }
    
   

}
