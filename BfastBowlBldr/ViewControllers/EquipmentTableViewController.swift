//
//  EquipmentTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class EquipmentTableViewController: UITableViewController, CellProtocol {
    
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    
    var equipmentImages = [String]()
    var equipmentNames = [String]()
    var equipmentCopy = [String]()
    var equipmentInfo = [String]()
    var equipmentPurch = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipmentImages = ["CitrusPress.jpeg",
                           "NutriBullet.jpeg",
                           "NutMilkBag.jpeg"]
        
        equipmentNames = ["Citrus Press Juicer",
                          "NutriBullet",
                          "Nut Milk Bag"]
        
        equipmentCopy = ["I use this almost daily to squeeze lemon or lime juice over my chopped fresh fruit, to add some Vitamin C and brighten up the flavor.",
                         "I use the NutriBullet 7 days a week.  I make my Almond Milk with it, smoothies, salad dressings - you name it.  It's a workhorse that has lasted several years already",
                         "You need one of these to make your own Nut Milk.  It couldn't be easier - just Google nut milk recipes and dive in"]
        
        equipmentInfo = ["https://www.amazon.com/Rated-Zulay-Premium-Quality-Squeezer/dp/B00YBP918M/ref=sr_1_cc_1?s=aps&ie=UTF8&qid=1521927198&sr=1-1-catcorr&keywords=citrus+squeezer",
                         "https://en.wikipedia.org/wiki/Magic_Bullet_(appliance)",
                         "https://www.amazon.com/Pro-Quality-Nut-Milk-Bag/dp/B00KLT6X9W/ref=sr_1_4?s=home-garden&ie=UTF8&qid=1521906953&sr=1-4&keywords=nut+milk+bag"]
        
        equipmentPurch = ["https://www.amazon.com/Rated-Zulay-Premium-Quality-Squeezer/dp/B00YBP918M/ref=sr_1_cc_1?s=aps&ie=UTF8&qid=1521927198&sr=1-1-catcorr&keywords=citrus+squeezer",
                          "https://www.amazon.com/NutriBullet-12-Piece-High-Speed-Blender-System/dp/B007TIE0GQ/ref=sr_1_3?s=kitchen&ie=UTF8&qid=1521906905&sr=1-3&keywords=nutribullet",
                          "https://www.amazon.com/Pro-Quality-Nut-Milk-Bag/dp/B00KLT6X9W/ref=sr_1_4?s=home-garden&ie=UTF8&qid=1521906953&sr=1-4&keywords=nut+milk+bag"]
        
        for i in 0 ..< equipmentCopy.count {
            let newIngredient = Ingredient(name: equipmentNames[i],
                                           imageString: equipmentImages[i],
                                           copy: equipmentCopy[i],
                                           info: equipmentInfo[i],
                                           purchaseURL: equipmentPurch[i],
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
        return equipmentNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        
        let row = indexPath.row
        cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, setDelegate: self)
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowEquipmentDetails", sender: indexPath.row)
        
        
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
        if segue.identifier == "ShowEquipmentDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.ingredientDetailImages = equipmentImages[row]
            detailViewController.ingredientAddlCopy = equipmentCopy[row]
            detailViewController.ingredientMoreInfo = equipmentInfo[row]
            detailViewController.ingredientPurchase = equipmentPurch[row]
        }
    }
}



