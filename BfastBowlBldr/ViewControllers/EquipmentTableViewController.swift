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
        
        equipmentImages = ["icon.jpg",
                           "icon.jpg"]
        
        equipmentNames = ["NutriBullet",
                          "Nut Milk Bag"]
        
        equipmentCopy = ["NutriBullet copy",
                         "Nut Milk Bag copy"]
        
        equipmentInfo = ["https://en.wikipedia.org",
                         "https://en.wikipedia.org"]
        
        equipmentPurch = ["https://www.amazon.com",
                          "https://www.amazon.com"]
        
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



