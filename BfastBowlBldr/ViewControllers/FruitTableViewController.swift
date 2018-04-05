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
            "Relatives to peaches, apricots are small, golden orange fruits, with velvety skin and flesh, not too juicy but definitely smooth and sweet. Some describe their flavor as almost musky, with a faint tartness that lies somewhere between a peach and a plum.",
            "A banana is a curved, yellow fruit with a thick skin and soft sweet flesh.  It is loaded with essential vitamins and minerals such as potassium, calcium, manganese, magnesium, iron, folate, niacin, riboflavin, and B6. These all contribute to the proper functioning of the body and keeping you healthy. The high content of potassium in bananas makes it a super fruit.",
            "A good daily supply of vital nutrients is required for a glowing and perfect skin. Blackberries are rich in Vitamin A and Vitamin C. They also offer the highest levels of some antioxidants – higher than blueberries and strawberries too. The very dark color of the fruit is proof of its high antioxidant level.",
            "The fiber, potassium, folate, vitamin C, vitamin B6, and phytonutrient content in blueberries supports heart health. The absence of cholesterol from blueberries is also beneficial to the heart. Fiber content helps to reduce the total amount of cholesterol in the blood and decrease the risk of heart disease.",
            "It scores 'very good' for potassium, and 'good' for a host of B vitamins (B1, B3, B6, and folate) as well as vitamin K, magnesium, and fiber. When the edible seeds of the cantaloupe are eaten, this melon also provides a measurable about of omega-3 fat in the form of alpha-linolenic acid.",
            "When you eat cherries, you enjoy much more than just their amazing taste. They're packed with antioxidants and offer many health benefits, including help with insomnia, joint pain and belly fat.",
            "Dragon fruits have a surprising number of phytonutrients. Rich in antioxidants, they contain vitamin C (equivalent to 10 percent of the daily value), polyunsaturated (good) fatty acids, and several B vitamins for carbohydrate metabolism, as well as carotene and protein.",
            "The health benefits of grapes include their ability to treat constipation, indigestion, fatigue, kidney disorders, macular degeneration, and prevent cataracts. Grapes are one of the most popular fruits in the world because of their taste, texture, flavor, variety, and ease of portability. This popular and delicious fruit is also packed with a lot of important nutrients.",
            "The combination of its high water content and potassium levels make honeydew melon effective at maintaining healthy blood pressure levels.  As honeydew contains both vitamin C and copper, they promote healthy skin by aiding collagen production and tissue repair",
            "Health benefits of kiwi include skin care, improved cardiovascular health, lower blood pressure, and prevention of strokes. It also aids in the treatment of cancer, insomnia, macular degeneration, and diabetes. Due to the flavonoid-rich compounds found in kiwi, it also helps during pregnancy and promotes the absorption of iron in the body. Besides, the anti-microbial properties of kiwi guard against a range of pathogens and strengthen the immune system.",
            "Lychee contains good amount of antioxidant Vitamin C, Vitamin B-complex and phytonutrient flavonoids. Lychee is a rich source of nutrient that is required for the production of blood. It provides manganese, magnesium, copper, iron and folate that are required for the formation of RBC.",
            "When you savor delicious and succulent mangos every season, you probably don’t think about the immense health benefits coming with every bite. Mango is known as the king of fruits. Beyond the sweet, luscious taste of mangos, they also contain an abundance of vitamins, minerals, and antioxidants that assure your optimum health.",
            "Oranges are low in calories and full of nutrients, they promote clear, healthy, skin and can help to lower our risk for many diseases as part of an overall healthy and varied diet.  An orange has over 170 different phytochemicals and more than 60 flavonoids. Many of these have been shown to have anti-inflammatory properties and strong antioxidant effects.",
            "Papaya is rich in antioxidant nutrients such as carotenes, flavonoids, and vitamin C, as well as vitamin B (folate and pantothenic acid). It is also a good source of fiber and minerals such as magnesium. Together, these nutrients help improve cardiovascular health and protect against colon cancer.",
            "Pears can help lower inflammation, which is the root of most diseases, plus they're one of the best sources of dietary fiber of all fruits and provide high amounts of vitamin C, vitamin K and boron.",
            "Pineapples are a storehouse of several health benefits due to its wealth of nutrients, vitamins, and minerals, including potassium, copper, manganese, calcium, magnesium, vitamin C, beta-carotene, thiamin, vitamin B6, and folate, and bromelain, as well as soluble and insoluble fiber.",
            "Rich in vitamins, antioxidants, and fiber, raspberries are a delicious fruit with many health benefits. They have a high concentration of ellagic acid, a phenolic compound that prevents cancer, thereby stopping the growth of cancer cells and eliminating the progress of cancers",
            "Strawberries are an excellent source of vitamins C and K as well as providing a good dose of fibre, folic acid, manganese and potassium. They also contain significant amounts of phytonutrients and flavanoids which makes strawberries bright red.",
            "Watermelons are mostly water — about 92 percent — but this refreshing fruit is soaked with nutrients. Each juicy bite has significant levels of vitamins A, B6 and C, lots of lycopene, antioxidants and amino acids. There's even a modest amount of potassium."
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
