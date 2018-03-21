//
//  BuildYourBowlTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/26/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class BuildYourBowlTableViewController: UITableViewController, CellProtocol {
    
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    
    var bowlImages = [String]()
    var bowlNames = [String]()
    var bowlCopy = [String]()
    var bowlInfo = [String]()
    var bowlPurch = [String]()
    var bowlType = [IngredientType]()
    
    @IBAction func bowlSelected(_ sender: UIButton) {
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< selectedIngredients.count {
            let newIngredient = Ingredient(name: bowlNames[i],
                                           imageString: bowlImages[i],
                                           copy: bowlCopy[i],
                                           info: bowlInfo[i],
                                           purchaseURL: bowlPurch[i],
                                           type: bowlType[i])
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
        return selectedIngredients.count
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
            print("Topping added/removed was \(String(describing: liquidSwitchSelected))")
            
            if status {
                selectedIngredients.append(ingredients[indexPath.row])
            } else {
                
                guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
                selectedIngredients.remove(at: index)
            }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

