//
//  IngredientTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/14/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController, CellProtocol {
    // MARK: This ingredient array is for the tableView data
    var ingredients = [Ingredient]()
    // MARK: This ingredient array is for the user selected ingredients
    var selectedIngredients = [Ingredient]()

    
//    let grainImages = ["Barley.jpg",
//                       "Buckwheat.jpg",
//                       "Bulgur.jpg",
//                       "Couscous.jpg",
//                       "Farro.jpeg",
//                       "Oatmeal.jpg",
//                       "Quinoa.jpg",
//                       "Rice.jpg",
//                       "Spelt.jpeg",
//                       "Wheatberries.jpeg"
//    ]
//    let grainNames = ["Barley",
//                      "Buckwheat Groats",
//                      "Bulgur",
//                      "Cous Cous (Pearl)",
//                      "Farro",
//                      "Oatmeal",
//                      "Quinoa",
//                      "Rice",
//                      "Spelt",
//                      "Wheat Berries"
//    ]
//    let grainCopy = ["Pearl Barley - one of the first grains ever cultivated - is a nice one to try if you haven't cooked with it recently.  Do use it cooked.",
//                     "I like to include 1 Tablespoon or more of Buckwheat Groats with whatever other grain I select, as I find it retains it's crunchy texture and is a nice contrast to my usual Oatmeal, or a cooked grain.  I simply toss them in raw - no cooking required.",
//                     "Bulgur Wheat is also a good choice if you need a change.  Do cook it in advance - it couldn't be any easier to make - and I love the Nutty flavor.",
//                     "I like the larger Pearl (or Israeli) Cous Cous for a change of pace.  I usually opt for the whole wheat version, but any will do.  Use it cooked, and if you are making some other Cous Cous dish, set aside a bit for your Breakfast Bowl experimentation.",
//                     "Farro is another one of my favorites, with a nutty flavor and unique, chewy texture.  Use it cooked.",
//                     "Oatmeal is my go-to grain of choice.  I use it raw, as the overnight soaking does the trick.  There are several varieties to choose from (traditional, steel cut, fast-cooking), so experiment and find a brand and style that works for you",
//                     "Quinoa is another go-to grain choice for me.  If I cook a big batch on a Sunday, I'll set aside some to use in bowls during the week.  Use it cooked.",
//                     "There are so many varieties of Rice to choose from that you just need to start with one and work your way through all of the choices.  Brown and Black are my current favorites.  If you like this, you should check out Congee for another breakfast (or any meal!) treat.  Use it cooked.",
//                     "Another ancient grain, Spelt is very similar to wheat nutritionally but slightly higher in zinc and protein.  Use it cooked.",
//                     "The wheat berry, or wheatberry, is the whole grain form of wheat, and comes in several varieties including Hard Red and Soft White.  Use it cooked."
//    ]
//    let grainInfo = ["https://draxe.com/barley-nutrition/",
//                     "https://draxe.com/buckwheat-nutrition/",
//                     "https://draxe.com/bulgur-wheat/",
//                     "https://en.wikipedia.org/wiki/Couscous",
//                     "https://www.healthline.com/nutrition/farro-benefits#section1",
//                     "https://en.wikipedia.org/wiki/Oatmeal",
//                     "https://en.wikipedia.org/wiki/Quinoa",
//                     "https://en.wikipedia.org/wiki/Rice",
//                     "https://www.healthline.com/nutrition/what-is-spelt#modal-close",
//                     "https://www.thekitchn.com/chewy-nutty-nutritious-wheat-berries-ingredient-spotlight-176749"
//    ]
//    let grainPurch = ["https://amzn.to/2JlnTxX", // Barley
//        "https://amzn.to/2GCDoDR", // Buckwheat Groats
//        "https://amzn.to/2HbWRsh", // Bulgur
//        "https://amzn.to/2Hd8Plt", // Cous cous
//        "https://amzn.to/2HaBpnd", // Farro
//        "https://amzn.to/2JiI5R0", // Oatmeal
//        "https://amzn.to/2JmoCiy", // Quinoa
//        "https://amzn.to/2GzNeGH", // Rice
//        "https://amzn.to/2GDdSKP", // Spelt
//        "https://amzn.to/2GzuT8I"  // Wheat Berries
//    ]
    func switchButtonTapped(WithStatus status: Bool, ForCell myCell: IngredientCell) {
        // using guard let syntax to unwrap the optional; if it returns nil then it exits the function and does nothing
        guard let indexPath = self.tableView.indexPath(for: myCell) else { return }
        print("cell at indexpath \(String(describing: indexPath)) tapped with switch status \(status)")
        let grainSwitchSelected = myCell.label.text!
        print("Grain added/removed was \(String(describing: grainSwitchSelected))")
        // MARK: - This code block adds or removes selected ingredients based on the status of the switch.
        if status {
            selectedIngredients.append(ingredients[indexPath.row])
        } else {
            // MARK: - This logic is here in the event that a given ingredient isn't in the selected ingredients array
            guard let index = selectedIngredients.index(where: { $0.name == ingredients[indexPath.row].name }) else { return }
            selectedIngredients.remove(at: index)
        }
    }
    @IBAction func grainSelected(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "IngredientData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let grainData = try JSONDecoder().decode([String : [String]].self, from: data)
            print(grainData)
        }
        catch {}
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
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grainNames.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        let row = indexPath.row
        cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, isSelected: selectedIngredients.contains {$0.name == grainNames[indexPath.row]}, setDelegate: self)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowGrainDetails", sender: indexPath.row)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "SelectLiquid":
            guard selectedIngredients.contains(where: {$0.type == .grain}) else {
                let alert = UIAlertController(title: "Bowl Builder Tip", message: "Please select at least one Grain before continuing", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alert, animated: true, completion: nil)
                return false
            }
        default:
            break
        }
        return true
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
