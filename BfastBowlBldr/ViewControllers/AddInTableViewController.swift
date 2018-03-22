//
//  AddInTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class AddInTableViewController: UITableViewController, CellProtocol {
    
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    
    let addinImages = ["Pepper.jpg",
    "Cacao.jpg",
    "ChiaSeeds.jpg",
    "icon.jpg",
    "DateRed.jpg",
    "Datemedjool.jpg",
    "Goji.jpg",
    "Matcha.jpg",
    "Moringa.jpg",
    "icon.jpg",
    "icon.jpg",
    "Turmeric.jpg"
    ]
    
    let addinNames = ["Black Pepper",
    "Cacao powder",
    "Chia Seeds",
    "Cinnamon",
    "Dates - Red",
    "Dates - Medjool",
    "Goji Berries",
    "Matcha",
    "Moringa",
    "Prune",
    "Raisin",
    "Turmeric"
    ]
    
    let addinCopy = ["Black Pepper copy",
    "Cacao powder copy",
    "Chia Seeds copy",
    "Cinnamon copy",
    "Dates - Red copy",
    "Dates - Medjool copy",
    "Goji Berries copy",
    "Matcha copy",
    "Moringa copy",
    "Prune copy",
    "Raisin copy",
    "Turmeric copy"
    ]
    
    let addinInfo = ["https://en.wikipedia.org/wiki/Black_pepper",
    "https://begoodorganics.com/blogs/subscriber-only-recipes/7991527-cacao-5-little-known-benefits-of-this-amazonian-superfood",
    "https://en.wikipedia.org/wiki/Chia_seed",
    "https://en.wikipedia.org/wiki/Cinnamon",
    "https://juicing-for-health.com/health-benefits-of-red-dates",
    "https://en.wikipedia.org/wiki/Medjool",
    "https://en.wikipedia.org/wiki/Goji",
    "https://en.wikipedia.org/wiki/Matcha",
    "https://greenvirginproducts.com/product-category/moringa/moringa-benefits/?gclid=EAIaIQobChMIhbKI7fWA2gIVhLfACh32QQp7EAAYASAAEgKWq_D_BwE",
    "https://en.wikipedia.org/wiki/Prune",
    "https://en.wikipedia.org/wiki/Raisin",
    "https://en.wikipedia.org/wiki/Turmeric"]
    
    let addinPurch = ["https://www.amazon.com/365-Everyday-Value-Organic-Pepper/dp/B075M4KPWW/ref=sr_1_1?srs=7301146011&ie=UTF8&qid=1521755834&sr=8-1&keywords=organic+black+pepper",
    "https://www.amazon.com/Viva-Naturals-Selling-Certified-Superior/dp/B00HES9CMS/ref=sr_1_3_a_it?ie=UTF8&qid=1521755900&sr=8-3&keywords=Cacao+powder",
    "https://www.amazon.com/Viva-Naturals-FINEST-Organic-Seeds/dp/B00OZYNGUS/ref=sr_1_5_s_it?s=grocery&ie=UTF8&qid=1521755934&sr=1-5&keywords=Chia+Seeds",
    "https://www.amazon.com/Organic-Wise-Ceylon-Cinnamon-Certified/dp/B00PXRX5TI/ref=sr_1_3_sspa?s=grocery&ie=UTF8&qid=1521755960&sr=1-3-spons&keywords=Cinnamon&psc=1",
    "https://www.amazon.com/NATURAL-ORGANICLLY-guarantee-UNBEATABLE-SELECTED/dp/B01EM0NSIO/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521755983&sr=1-4&keywords=red%2Bdates&th=1",
    "https://www.amazon.com/Terrasoul-Superfoods-Organic-Medjool-Pounds/dp/B01MREWFHO/ref=sr_1_2_s_it?s=grocery&ie=UTF8&qid=1521756020&sr=1-2&keywords=medjool",
    "https://www.amazon.com/Viva-Naturals-Premium-Himalayan-Noticeably/dp/B00PWW3LQ6/ref=sr_1_5_s_it?s=grocery&ie=UTF8&qid=1521756041&sr=1-5&keywords=Goji+Berries",
    "https://www.amazon.com/Jade-Leaf-Matcha-Green-Powder/dp/B00PFDH0IC/ref=sr_1_1_sspa?s=grocery&ie=UTF8&qid=1521756064&sr=1-1-spons&keywords=Matcha&psc=1",
    "https://www.amazon.com/Terrasoul-Superfoods-Organic-Moringa-Powder/dp/B013KP50PQ/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521756087&sr=1-4&keywords=Moringa",
    "https://www.amazon.com/Newmans-Own-Organic-Prunes-Oz/dp/B000VK9XYI/ref=sr_1_3_s_it?ie=UTF8&qid=1521756110&sr=1-3&keywords=Prune",
    "https://www.amazon.com/Dole-California-Seedless-Raisins-Ounce/dp/B01H6JDP9U/ref=sr_1_1?srs=7301146011&ie=UTF8&qid=1521756154&sr=8-1&keywords=raisin",
    "https://www.amazon.com/Healthworks-Turmeric-Powder-Curcumin-Organic/dp/B01ETL0Y6U/ref=sr_1_5_a_it?ie=UTF8&qid=1521756196&sr=8-5&keywords=turmeric"]
    
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell) {
        
        guard let indexPath = self.tableView.indexPath(for: myCell) else { return }
        print("cell at indexpath \(String(describing: indexPath)) tapped with switch status \(status)")
        
        let addinSwitchSelected = myCell.label.text!
        print("AddIn added/removed was \(String(describing: addinSwitchSelected))")
        
        if status {
            selectedIngredients.append(ingredients[indexPath.row])
        } else {
            
            guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
            selectedIngredients.remove(at: index)
        }
    }
    
    @IBAction func addInSelected(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0 ..< addinCopy.count {
            let newIngredient = Ingredient(name: addinNames[i],
                                           imageString: addinImages[i],
                                           copy: addinCopy[i],
                                           info: addinInfo[i],
                                           purchaseURL: addinPurch[i],
                                           type: .addIn)
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
        return addinNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        
        let row = indexPath.row
        cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, setDelegate: self)
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowAddinDetails", sender: indexPath.row)
        
        
    }
    
 
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowAddinDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            guard let row = sender as? Int else { fatalError("Unable to cast sender as Int")}
            detailViewController.ingredientDetailImages = addinImages[row]
            detailViewController.ingredientAddlCopy = addinCopy[row]
            detailViewController.ingredientMoreInfo = addinInfo[row]
            detailViewController.ingredientPurchase = addinPurch[row]
        }
        
        if segue.identifier == "SelectFruit" {
            
         //   print (selectedIngredients)
            
            let FruitTableViewController = segue.destination as! FruitTableViewController
            FruitTableViewController.selectedIngredients = selectedIngredients
        }
        
    }
    
    
}

