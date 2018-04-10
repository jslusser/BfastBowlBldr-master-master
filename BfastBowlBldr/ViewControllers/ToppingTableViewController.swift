//
//  ToppingTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class ToppingTableViewController: UITableViewController, CellProtocol {
    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
    var toppingImages = [String]()
    var toppingNames = [String]()
    var toppingCopy = [String]()
    var toppingInfo = [String]()
    var toppingPurch = [String]()
    @IBAction func toppingSelected(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        toppingImages = ["Almond.jpg",
                         "Basil.jpeg",
                         "Brazil.jpg",
                         "Coconut.jpeg",
                         "Hempseed.jpg",
                         "Honey.jpeg",
                         "caroline-attwood-574690-unsplash.jpg", // Lemon
            "raghu-nayyar-459422-unsplash.jpg", // Lime
            "Mint.jpeg",
            "Pecan.jpeg",
            "Pumpkin.jpg",
            "Sunflower.jpg",
            "Walnut.jpg",
            "Wheatgerm.jpeg",
            "CoconutYogurt.png"
        ]
        toppingNames = ["Almond",
                        "Basil",
                        "Brazil Nut",
                        "Coconut",
                        "Hemp Seed",
                        "Honey",
                        "Lemon juice/zest",
                        "Lime juice/zest",
                        "Mint",
                        "Pecan",
                        "Pumpkin Seed",
                        "Sunflower Seed",
                        "Walnuts",
                        "Wheat Germ",
                        "Yogurt - Non-Dairy"
        ]
        toppingCopy = ["Almonds contain lots of healthy fats, fiber, protein, magnesium and vitamin E. The health benefits of almonds include lower blood sugar levels, reduced blood pressure and lower cholesterol levels. They can also reduce hunger and promote weight loss.",
                       "Basil for breakfast?  Trust me - if you are using strawberries in your bowl, add some chopped, fresh basil leaves and I think you will find they compliment each other quite nicely.",
                       "Brazil nuts are commonly eaten raw or blanched and are high in protein, fiber, selenium, thiamine, copper and magnesium — and in addition to being the best selenium food source in the world, they provide numerous benefits for our health.",
                       "There are two types of shredded coconut—sweetened and unsweetened (I only use unsweetened).  Both start out as raw coconut meat that's then boiled, grated, and dried. The dehydrated shreds are either immediately packaged and sold as unsweetened coconut or soaked in a liquid sugar solution and dried again to make sweetened coconut.",
                       "Hemp seeds are rich in healthy fats and essential fatty acids. They are also a great protein source and contain high amounts of vitamin E, phosphorus, potassium, sodium, magnesium, sulfur, calcium, iron and zinc",
                       "8 Health Benefits of Raw Honey; Healthy Weight Management. Counters Pollen Allergies. Natural Energy Source. Antioxidant Powerhouse. Sleep Promoter. Wound and Ulcer Healer. Diabetes Aid. Natural Cough Syrup.",
                       "I'll squeeze Lemon or Lime Juice over my fresh chopped fruit to prevent browning, add some extra vitamin C and to just brighten up the flavor.",
                       "I'll squeeze Lemon or Lime Juice over my fresh chopped fruit to prevent browning, add some extra vitamin C and to just brighten up the flavor.",
                       "The great thing about mint is that it smells great and it’s so easy to grow. Sprinkle some chopped mint leaves onto your bowl for a hit of freshness.",
                       "Pecans contain more antioxidants than any other tree nut and rank among the top 15 foods with the highest levels of antioxidants according to the USDA. They are also a powerhouse of vitamins and minerals such as manganese, potassium, calcium, iron, magnesium, zinc, and selenium, offering some wonderful health benefits.",
                       "9 Top Health Benefits of Pumpkin Seeds. Heart Healthy Magnesium. Zinc for Immune Support. Plant-Based Omega-3 Fats. Prostate Health. Anti-Diabetic Effects. Benefits for Postmenopausal Women. Heart and Liver Health. Tryptophan for Restful Sleep.",
                       "Top Health Benefits of Sunflower Seeds. Reduces Risk for Heart Disease. Helps to Prevent Cancer Due to High Antioxidant Content. Supports Thyroid Function Through Selenium. Helps Combat Osteoporosis, Bone Loss, and Muscle Cramps. Balances Blood Sugar Levels and Helps Ward off Diabetes. Improves Skin Health.",
                       "Walnuts contain a number of neuroprotective compounds, including vitamin E, folate, melatonin, omega-3 fats, and antioxidants. Research shows walnut consumption may support brain health, including increasing inferential reasoning in young adults.",
                       "It's a great source of vegetable proteins, along with fiber and healthy fats. It's also a good source of magnesium, zinc, thiamin, folate, potassium, and phosphorus. Wheat germ is high in vitamin E, an essential nutrient with antioxidant properties.",
                       "There are many non-dairy options available (Soy, Almond, Coconut, etc.), but I personally prefer Coconut.  Try them all and find your own favorite.  Coconutmilk yogurt alternatives deliver dairy-free culture with amazing flavor and just the right balance of tanginess and sweetness.  Homemade coconut yogurt is easy and awesome - Google a recipe and try it youself!"
        ]
        toppingInfo = ["https://www.bbcgoodfood.com/howto/guide/health-benefits-almonds",
                       "https://www.precisionnutrition.com/healthy-basil",
                       "https://en.wikipedia.org/wiki/Brazil_nut",
                       "http://healthyeating.sfgate.com/benefits-eating-shredded-coconut-4027.html",
                       "https://www.healthline.com/nutrition/6-health-benefits-of-hemp-seeds",
                       "https://en.wikipedia.org/wiki/Honey",
                       "https://www.organicfacts.net/health-benefits/fruit/health-benefits-of-lemon.html",
                       "https://www.organicfacts.net/health-benefits/fruit/health-benefits-of-lime.html",
                       "https://www.healthline.com/nutrition/mint-benefits",
                       "https://food.ndtv.com/food-drinks/why-pecan-nuts-are-good-for-you-and-how-to-eat-them-1262183",
                       "https://en.wikipedia.org/wiki/Pumpkin_seed",
                       "https://en.wikipedia.org/wiki/Sunflower_seed",
                       "https://en.wikipedia.org/wiki/Walnut",
                       "https://www.healthline.com/health/wheat-germ-benefits#modal-close",
                       "https://www.myorganiclife.info/coconut-yoghurt/"
        ]
        toppingPurch = ["https://amzn.to/2HhyWaC", //Almonds
            "https://amzn.to/2GWV9xg",  //Basil
            "https://amzn.to/2HbScWZ", // Brazil Nut
            "https://amzn.to/2IFZSQW", // Coconut
            "https://amzn.to/2GD5Txo", // Hemp Seed
            "https://amzn.to/2q6RJxZ", // Honey
            "https://amzn.to/2EmXqw6", // Lemon juice
            "https://amzn.to/2EiQ8cV", // Lime juice
            "https://amzn.to/2Jn6CnV", // Mint
            "https://amzn.to/2HkK6f2", // Pecan
            "https://amzn.to/2uNkZ1M", // Pumpkin Seed
            "https://amzn.to/2HbjZqL", // Sunflower Seed
            "https://amzn.to/2GDllJA", // Walnut
            "https://amzn.to/2H9YJS1", // Wheat Germ
            "https://amzn.to/2ICjxkV" // Coconut Yogurt
        ]
        for i in 0 ..< toppingCopy.count {
            let newIngredient = Ingredient(name: toppingNames[i],
                                           imageString: toppingImages[i],
                                           copy: toppingCopy[i],
                                           info: toppingInfo[i],
                                           purchaseURL: toppingPurch[i],
                                           type: .topping)
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
        return toppingNames.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        let row = indexPath.row
        cell.configure(textForLabel: ingredients[row].name, image: ingredients[row].imageString, setDelegate: self)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowToppingDetails", sender: indexPath.row)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "BuildBowl":
            guard selectedIngredients.contains(where: {$0.type == .topping}) else {
                let alert = UIAlertController(title: "Bowl Builder Tip", message: "Please select at least one Topping before continuing", preferredStyle: UIAlertControllerStyle.alert)
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
        print("Topping added/removed was \(String(describing: liquidSwitchSelected))")
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
        if segue.identifier == "ShowToppingDetails" {
            let detailViewController = segue.destination as! IngredientDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.ingredientDetailImages = toppingImages[row]
            detailViewController.ingredientAddlCopy = toppingCopy[row]
            detailViewController.ingredientMoreInfo = toppingInfo[row]
            detailViewController.ingredientPurchase = toppingPurch[row]
        }
        if segue.identifier == "BuildBowl" {
            print (selectedIngredients)
            let BYBTableViewController = segue.destination as! BYBTableViewController
            BYBTableViewController.selectedIngredients = selectedIngredients
        }
    }
}
