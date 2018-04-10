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
    let addinImages = ["Acai.jpg",
                       "Pepper.jpg",
                       "Cacao.jpg",
                       "Camu.jpg",
                       "CherriesDried.jpg",
                       "ChiaSeeds.jpg",
                       "Cinnamon.jpeg",
                       "DateRed.jpg",
                       "Datemedjool.jpg",
                       "Ginger.jpg",
                       "Goji.jpg",
                       "Lucuma.jpg",
                       "Maca.jpg",
                       "Matcha.jpeg",
                       "Moringa.jpg",
                       "PBPowder.jpeg",
                       "Prune.jpeg",
                       "Raisin.jpeg",
                       "Turmeric.jpg",
                       "Vanilla.jpeg"
    ]
    let addinNames = ["Acai Powder",
                      "Black Pepper",
                      "Cacao Powder",
                      "Camu Camu Powder",
                      "Cherries (dried)",
                      "Chia Seeds",
                      "Cinnamon",
                      "Dates - Red",
                      "Dates - Medjool",
                      "Ginger",
                      "Goji Berries",
                      "Lucuma Powder",
                      "Maca Powder",
                      "Matcha",
                      "Moringa",
                      "Peanut Butter Powder",
                      "Prune",
                      "Raisin",
                      "Turmeric",
                      "Vanilla Powder"
    ]
    let addinCopy = ["The super fruit acai (ah-sigh-ee) is known for its healing, immune boosting and energy-boosting properties.",
                     "Black Pepper for breakfast?  Hear me out.  If you are adding Turmeric to your bowl (and you should), Black Pepper can increase the bioavailability and effectiveness of the Turmeric.",
                     "Cacao powder is a source of magnesium, iron and is high in flavonoids, which have antioxidant activity.  In addition, cacao contains a compound called phenylethylamine (PEA for short!). PEA is thought to elevate mood and support energy, and is said to be one of the reasons that many people love chocolate!",
                     "Camu Camu is a nutrient dense super fruit that contains the highest level of Vitamin C of any plant on earth making it a potent immune boost.",
                     "Sometimes I'll swap dried Cherries instead of raisins for a change of pace",
                     "Chia Seeds are an excellent source of omega-3 fatty acids, rich in antioxidants, and they provide fiber, iron, and calcium. Omega-3 fatty acids help raise HDL cholesterol, the 'good' cholesterol that protects against heart attack and stroke.",
                     "Cinnamon is one of the most delicious and healthiest spices on the planet. It can lower blood sugar levels, reduce heart disease risk factors, and has a plethora of other impressive health benefits",
                     "Red Dates, also knows as Jujube, have potent health benefits. They have calming properties and are a good source of natural antioxidants",
                     "The nutrients that provide the many health benefits of Medjool dates include dietary fiber, potassium, manganese, copper, B family vitamins, vitamin A, magnesium, and calcium.",
                     "I tent to toss in a bit of Ginger in almost every bowl I make, not only for the taste but also the health benefits.  Try to use fresh ginger root, but ready-to-use minced Ginger or powdered Ginger will also work.",
                     "Goji berries, a fruit that comes from the Chinese Lycium barbarum plant, have been used as a traditional medicine for general health, and recent studies suggest there is real evidence for its purported benefits. Many types of berries offer beneficial antioxidants that protect the body against chronic disease, and goji berries may contain additional properties to improve eye health.",
                     "Lucuma powder delivers an abundance of healthy benefits when added to your favorite food or beverage. In addition to satisfying your sweet tooth, lucuma is gluten-free and a source of antioxidants, fiber, carbohydrates, vitamins and minerals necessary for bodily functions and of benefit to the immune system.",
                     "Maca is a root vegetable that is high in antioxidants and nutrients, such as vitamin C, copper and iron. It has been used medicinally for thousands of years and has been shown to enhance sexual health and libido; improve energy, mood and memory; and balance hormone levels.",
                     "Amongst its many health benefits, Matcha… Is packed with antioxidants including the powerful EGCg. Boosts metabolism and burns calories. Detoxifies effectively and naturally. Calms the mind and relaxes the body. Is rich in fiber, chlorophyll and vitamins. Enhances mood and aids in concentration.",
                     "Moringa leaves are high in several anti-aging compounds that lower the effects of oxidative stress and inflammation, including polyphenols, vitamin C, beta-carotene, quercetin, and chlorogenic acid",
                     "Powdered peanut butter is made from roasted peanuts that have been pressed to remove most of the oil and then ground into a fine powder. Some brands contain a little sugar and salt. With most of the fat gone—powdered peanut butter has about 85 percent less than regular—you're left with protein and fiber.",
                     "Prunes are a great source of vitamin A, a vitamin that is essential for healthy vision. Powerhouse of Antioxidants. Heart Healthy. Relieves Constipation. Protection Against Osteoporosis. Promotes Hair Health. Great for Skin.",
                     "Despite their small size, raisins are packed with energy and rich in fiber, vitamins, and minerals. Raisins are naturally sweet and high in sugar and calories, but they're beneficial to our health when eaten in moderation. In fact, raisins can aid digestion, boost iron levels, and keep your bones strong.",
                     "Try to use fresh Turmeric root if you can find it, but powdered Turmeric will also work.  Curcumin is the main active ingredient in Turmeric. It has powerful anti-inflammatory effects and is a very strong antioxidant.  Interestingly, Black Pepper can increase the bioavailability and effectiveness of the Turmeric, so grind in a bit of pepper when using Turmeric",
                     "Vanilla powder is prepared ​​from raw organic vanilla beans that have been dried at low temperatures and finely ground. Vanilla powder contains a variety of vitamins and minerals and boasts a fragrant aroma and velvety smooth flavour."
    ]
    let addinInfo = ["https://www.healthline.com/nutrition/benefits-of-acai-berries#section2",
                     "https://en.wikipedia.org/wiki/Black_pepper",
                     "https://begoodorganics.com/blogs/subscriber-only-recipes/7991527-cacao-5-little-known-benefits-of-this-amazonian-superfood",
                     "https://draxe.com/camu-camu/",
                     "https://en.wikipedia.org/wiki/Cherry",
                     "https://en.wikipedia.org/wiki/Chia_seed",
                     "https://en.wikipedia.org/wiki/Cinnamon",
                     "https://juicing-for-health.com/health-benefits-of-red-dates",
                     "https://en.wikipedia.org/wiki/Medjool",
                     "https://www.healthline.com/nutrition/11-proven-benefits-of-ginger#section4",
                     "https://en.wikipedia.org/wiki/Goji",
                     "https://www.globalhealingcenter.com/natural-health/what-is-lucuma/",
                     "https://draxe.com/top-5-maca-root-benefits-and-nutrition/",
                     "https://en.wikipedia.org/wiki/Matcha",
                     "https://greenvirginproducts.com/product-category/moringa/moringa-benefits/?gclid=EAIaIQobChMIhbKI7fWA2gIVhLfACh32QQp7EAAYASAAEgKWq_D_BwE",
                     "https://www.healthline.com/nutrition/pb2-powdered-peanut-butter#section4",
                     "https://en.wikipedia.org/wiki/Prune",
                     "https://en.wikipedia.org/wiki/Raisin",
                     "https://en.wikipedia.org/wiki/Turmeric",
                     "https://www.thekitchn.com/good-question-what-is-vanilla-83146"
    ]
    let addinPurch = ["https://amzn.to/2IyfR3F", // Acai Powder
        "https://amzn.to/2JoHbma", // Black Pepper
        "https://amzn.to/2uReT0p", // Cacao Powder
        "https://amzn.to/2JidNOd", // Camu Camu Powder
        "https://amzn.to/2q9cjwT", // Cherries
        "https://amzn.to/2GB76oB", // Chia Seeds
        "https://amzn.to/2Jkx0Pk", // Cinnamon
        "https://amzn.to/2uNjxMS", // Dates - Red
        "https://amzn.to/2EmGg1C", // Dates - Medjool
        "https://amzn.to/2H3Tx4F", // Ginger
        "https://amzn.to/2GDketE", // Goji Berries        
        "https://amzn.to/2uOQGHP", // Lucuma powder
        "https://amzn.to/2GzSb29", // Maca Powder
        "https://amzn.to/2HgzEVX", // Matcha Powder
        "https://amzn.to/2HdgvE7", // Moringa Powder
        "https://amzn.to/2JA7F4a", // Peanut Butter Powder
        "https://amzn.to/2JjDuy9", // Prune
        "https://amzn.to/2uNQoBj", // Raisin
        "https://amzn.to/2EpPoCY", // Turmeric
        "https://amzn.to/2JmGg5N" // Vanilla Powder
    ]
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
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "SelectFruit":
            guard selectedIngredients.contains(where: {$0.type == .addIn}) else {
                let alert = UIAlertController(title: "Bowl Builder Tip", message: "Please select at least one AddIn before continuing", preferredStyle: UIAlertControllerStyle.alert)
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
