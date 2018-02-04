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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toppingImages = ["Brazil.jpg",
                         "icon.jpg",
                         "icon.jpg",
                         "icon.jpg",
                         "icon.jpg",
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
        
        toppingInfo = ["https://en.wikipedia.org",
                       "https://en.wikipedia.org",
                       "https://en.wikipedia.org",
                       "https://en.wikipedia.org",
                       "https://en.wikipedia.org",
                       "https://en.wikipedia.org",
                       "https://en.wikipedia.org",
                       "https://en.wikipedia.org"
        ]
        
        toppingPurch = ["https://www.amazon.com",
                        "https://www.amazon.com",
                        "https://www.amazon.com",
                        "https://www.amazon.com",
                        "https://www.amazon.com",
                        "https://www.amazon.com",
                        "https://www.amazon.com",
                        "https://www.amazon.com"
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
    }
    
   

}
