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

    @IBAction func fruitSelected(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitImages = [
            "Apple.jpg",
            "Apricot.jpg",
            "scott-webb-98682-unsplash.jpg",
            "Blackberries.jpg",
            "Blueberries.jpg",
            "Cantaloupe.jpg",
            "Cherries.jpg",
            "DragonFruit.jpg",
            "Grapes.jpg",
            "Honeydew.jpg",
            "Kiwi.jpg",
            "neha-deshmukh-5764-unsplash.jpg",
            "Mango.jpg",
            "Orange.jpg",
            "Papaya.jpeg",
            "clem-onojeghuo-72904-unsplash.jpg",
            "carlota-trillo-328189-unsplash.jpg",
            "Raspberries.jpg",
            "hoang-v-n-81485-unsplash.jpg",
            "Watermelon.jpg"
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
            "Lychee",
            "Mango",
            "Orange",
            "Papaya",
            "Pear",
            "Pineapple",
            "Raspberries",
            "Strawberries",
            "Watermelon"
        ]
        
        fruitCopy = [
            "There are so many varieties to pick from, I suggest you try as many as you can and find the ones that you like.  Personally I like Fuji, Honey Crisp and Granny Smith depending on my mood and the other ingredients I am using.",
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
            "Lychee copy",
            "Mango copy",
            "Orange copy",
            "Papaya copy",
            "Pear copy",
            "Pineapple copy",
            "Raspberries copy",
            "Strawberries copy",
            "Watermelon copy"
        ]
        
        fruitInfo = [
            "https://en.wikipedia.org/wiki/Apple",
            "https://en.wikipedia.org/wiki/Apricot",
            "https://en.wikipedia.org/wiki/Banana",
            "https://en.wikipedia.org/wiki/Blackberry",
            "https://en.wikipedia.org/wiki/Blueberry",
            "https://en.wikipedia.org/wiki/Cantaloupe",
            "https://en.wikipedia.org/wiki/Cherry",
            "https://en.wikipedia.org/wiki/Pitaya",
            "https://en.wikipedia.org/wiki/Grape",
            "https://en.wikipedia.org/wiki/Honeydew_(melon)",
            "https://en.wikipedia.org/wiki/Kiwifruit",
            "https://en.wikipedia.org/wiki/Lychee",
            "https://en.wikipedia.org/wiki/Mango",
            "https://en.wikipedia.org/wiki/Orange_(fruit)",
            "https://en.wikipedia.org/wiki/Papaya",
            "https://en.wikipedia.org/wiki/Pear",
            "https://en.wikipedia.org/wiki/Pineapple",
            "https://en.wikipedia.org/wiki/Raspberry",
            "https://en.wikipedia.org/wiki/Strawberry",
            "https://en.wikipedia.org/wiki/Watermelon"
        ]
        
        fruitPurch = [
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable",
            "NotAvailable"
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowFruitDetails", sender: indexPath.row)
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "SelectTopping":
            guard selectedIngredients.contains(where: {$0.type == .fruit}) else {
                let alert = UIAlertController(title: "Bowl Builder Tip", message: "Please select at least one Fruit before continuing", preferredStyle: UIAlertControllerStyle.alert)
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
        
        if segue.identifier == "SelectTopping" {
            
           // print (selectedIngredients)
            
            let ToppingTableViewController = segue.destination as! ToppingTableViewController
            ToppingTableViewController.selectedIngredients = selectedIngredients
        }
        
    }
    
 

}
