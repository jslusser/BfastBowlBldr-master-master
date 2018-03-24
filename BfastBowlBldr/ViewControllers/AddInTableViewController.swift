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
    "CherriesDried.jpg",
    "ChiaSeeds.jpg",
    "Cinnamon.jpeg",
    "DateRed.jpg",
    "Datemedjool.jpg",
    "Goji.jpg",
    "Lucuma.jpg",
    "Maca.jpg",
    "Matcha.jpeg",
    "Moringa.jpg",
    "Prune.jpeg",
    "Raisin.jpeg",
    "Turmeric.jpg"
    ]
    
    let addinNames = ["Black Pepper",
    "Cacao powder",
    "Cherries (dried)",
    "Chia Seeds",
    "Cinnamon",
    "Dates - Red",
    "Dates - Medjool",
    "Goji Berries",
    "Lucuma Powder",
    "Maca Powder",
    "Matcha",
    "Moringa",
    "Prune",
    "Raisin",
    "Turmeric"
    ]
    
    let addinCopy = ["Black Pepper for breakfast?  Hear me out.  If you are adding Turmeric to your bowl (and you should), Black Pepper can increase the bioavailability and effectiveness of the Turmeric.",
    "Cacao powder is a source of magnesium, iron and is high in flavonoids, which have antioxidant activity.  In addition, cacao contains a compound called phenylethylamine (PEA for short!). PEA is thought to elevate mood and support energy, and is said to be one of the reasons that many people love chocolate!",
    "Cherries (dried) copy",
    "Chia Seeds are an excellent source of omega-3 fatty acids, rich in antioxidants, and they provide fiber, iron, and calcium. Omega-3 fatty acids help raise HDL cholesterol, the 'good' cholesterol that protects against heart attack and stroke.",
    "Cinnamon s one of the most delicious and healthiest spices on the planet. It can lower blood sugar levels, reduce heart disease risk factors, and has a plethora of other impressive health benefits",
    "Red Dates, also knows as Jujube, have potent health benefits. They have calming properties and are a good source of natural antioxidants",
    "The nutrients that provide the many health benefits of Medjool dates include dietary fiber, potassium, manganese, copper, B family vitamins, vitamin A, magnesium, and calcium.",
    "Goji berries, a fruit that comes from the Chinese Lycium barbarum plant, have been used as a traditional medicine for general health, and recent studies suggest there is real evidence for its purported benefits. Many types of berries offer beneficial antioxidants that protect the body against chronic disease, and goji berries may contain additional properties to improve eye health.",
    "Lucuma powder delivers an abundance of healthy benefits when added to your favorite food or beverage. In addition to satisfying your sweet tooth, lucuma is gluten-free and a source of antioxidants, fiber, carbohydrates, vitamins and minerals necessary for bodily functions and of benefit to the immune system.",
    "Maca is a root vegetable that is high in antioxidants and nutrients, such as vitamin C, copper and iron. It has been used medicinally for thousands of years and has been shown to enhance sexual health and libido; improve energy, mood and memory; and balance hormone levels.",
    "Amongst its many health benefits, Matcha… Is packed with antioxidants including the powerful EGCg. Boosts metabolism and burns calories. Detoxifies effectively and naturally. Calms the mind and relaxes the body. Is rich in fiber, chlorophyll and vitamins. Enhances mood and aids in concentration.",
    "Moringa leaves are high in several anti-aging compounds that lower the effects of oxidative stress and inflammation, including polyphenols, vitamin C, beta-carotene, quercetin, and chlorogenic acid",
    "Prunes are a great source of vitamin A, a vitamin that is essential for healthy vision. Powerhouse of Antioxidants. Heart Healthy. Relieves Constipation. Protection Against Osteoporosis. Promotes Hair Health. Great for Skin.",
    "Despite their small size, raisins are packed with energy and rich in fiber, vitamins, and minerals. Raisins are naturally sweet and high in sugar and calories, but they're beneficial to our health when eaten in moderation. In fact, raisins can aid digestion, boost iron levels, and keep your bones strong.",
    "Curcumin is the main active ingredient in Turmeric. It has powerful anti-inflammatory effects and is a very strong antioxidant.  Interestingly, Black Pepper can increase the bioavailability and effectiveness of the Turmeric, so grind in a bit of pepper when using Turmeric"
    ]
    
    let addinInfo = ["https://en.wikipedia.org/wiki/Black_pepper",
    "https://begoodorganics.com/blogs/subscriber-only-recipes/7991527-cacao-5-little-known-benefits-of-this-amazonian-superfood",
    "https://www.amazon.com/Sunrise-Company-Cherries-16-oz/dp/B00CN5447A/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521908128&sr=1-4&keywords=dried+unsweetened+cherries",
    "https://en.wikipedia.org/wiki/Chia_seed",
    "https://en.wikipedia.org/wiki/Cinnamon",
    "https://juicing-for-health.com/health-benefits-of-red-dates",
    "https://en.wikipedia.org/wiki/Medjool",
    "https://en.wikipedia.org/wiki/Goji",
    "https://www.globalhealingcenter.com/natural-health/what-is-lucuma/",
    "https://draxe.com/top-5-maca-root-benefits-and-nutrition/",
    "https://en.wikipedia.org/wiki/Matcha",
    "https://greenvirginproducts.com/product-category/moringa/moringa-benefits/?gclid=EAIaIQobChMIhbKI7fWA2gIVhLfACh32QQp7EAAYASAAEgKWq_D_BwE",
    "https://en.wikipedia.org/wiki/Prune",
    "https://en.wikipedia.org/wiki/Raisin",
    "https://en.wikipedia.org/wiki/Turmeric"]
    
    let addinPurch = ["https://www.amazon.com/365-Everyday-Value-Organic-Pepper/dp/B075M4KPWW/ref=sr_1_1?srs=7301146011&ie=UTF8&qid=1521755834&sr=8-1&keywords=organic+black+pepper",
    "https://www.amazon.com/Viva-Naturals-Selling-Certified-Superior/dp/B00HES9CMS/ref=sr_1_3_a_it?ie=UTF8&qid=1521755900&sr=8-3&keywords=Cacao+powder",
    "https://www.amazon.com/Sunrise-Company-Cherries-16-oz/dp/B00CN5447A/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521908128&sr=1-4&keywords=dried+unsweetened+cherries",
    "https://www.amazon.com/Viva-Naturals-FINEST-Organic-Seeds/dp/B00OZYNGUS/ref=sr_1_5_s_it?s=grocery&ie=UTF8&qid=1521755934&sr=1-5&keywords=Chia+Seeds",
    "https://www.amazon.com/Organic-Wise-Ceylon-Cinnamon-Certified/dp/B00PXRX5TI/ref=sr_1_3_sspa?s=grocery&ie=UTF8&qid=1521755960&sr=1-3-spons&keywords=Cinnamon&psc=1",
    "https://www.amazon.com/NATURAL-ORGANICLLY-guarantee-UNBEATABLE-SELECTED/dp/B01EM0NSIO/ref=sr_1_4_s_it?s=grocery&ie=UTF8&qid=1521755983&sr=1-4&keywords=red%2Bdates&th=1",
    "https://www.amazon.com/Terrasoul-Superfoods-Organic-Medjool-Pounds/dp/B01MREWFHO/ref=sr_1_2_s_it?s=grocery&ie=UTF8&qid=1521756020&sr=1-2&keywords=medjool",
    "https://www.amazon.com/Viva-Naturals-Premium-Himalayan-Noticeably/dp/B00PWW3LQ6/ref=sr_1_5_s_it?s=grocery&ie=UTF8&qid=1521756041&sr=1-5&keywords=Goji+Berries",
    "https://www.amazon.com/Navitas-Organics-Lucuma-Powder-Ounce/dp/B01LZ2KR8W/ref=sr_1_1?s=home-garden&ie=UTF8&qid=1521907810&sr=1-1&keywords=lucuma+powder",
    "https://www.amazon.com/Viva-Naturals-Gelatinized-Enhanced-Bioavailability/dp/B00HES7572/ref=sr_1_2_sspa?s=home-garden&ie=UTF8&qid=1521907946&sr=1-2-spons&keywords=maca+powder&psc=1",
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

