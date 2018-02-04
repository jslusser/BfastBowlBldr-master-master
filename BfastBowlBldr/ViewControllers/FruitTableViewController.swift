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
    
    var fruitImages = [String]()
    var fruitNames = [String]()
    var fruitCopy = [String]()
    var fruitInfo = [String]()
    var fruitPurch = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitImages = [
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg",
            "icon.jpg"
        ]
        
        fruitNames = [
        "Apple",
        "Apricot",
        "Banana",
        "Blackberries",
        "Blueberries",
        "Cantaloupe",
        "Cherries",
        "Dragon Fruit",
        "Grapes",
        "Honeydew melon",
        "Kiwi",
        "Mango",
        "Orange",
        "Pineapple",
        "Raspberries",
        "Watermelon"
        ]
        
        fruitCopy = [
        "Apple copy",
        "Apricot copy",
        "Banana copy",
        "Blackberries copy",
        "Blueberries copy",
        "Cantaloupe copy",
        "Cherries copy",
        "Dragon Fruit copy",
        "Grapes copy",
        "Honeydew melon copy",
        "Kiwi copy",
        "Mango copy",
        "Orange copy",
        "Pineapple copy",
        "Raspberries copy",
        "Watermelon copy"
        ]
        
        fruitInfo = [
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org",
        "https://en.wikipedia.org"
        ]
        
        fruitPurch = [
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com",
        "https://www.amazon.com"
        ]
        
        for i in 0 ..< fruitCopy.count {
            let newIngredient = Ingredient(name: fruitNames[i],
                                           imageString: fruitImages[i],
                                           copy: fruitCopy[i],
                                           info: fruitInfo[i],
                                           purchaseURL: fruitPurch[i],
                                           type: .fruit)
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
        return fruitNames.count
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
        if segue.identifier == "ShowFruitDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.ingredientDetailImages = fruitImages[row]
            detailViewController.ingredientAddlCopy = fruitCopy[row]
            detailViewController.ingredientMoreInfo = fruitInfo[row]
            detailViewController.ingredientPurchase = fruitPurch[row]
        }
    }
    
 

}
