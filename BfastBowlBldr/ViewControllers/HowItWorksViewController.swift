//
//  HowItWorksViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/20/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class HowItWorksViewController: UIViewController {

   
    
    @IBOutlet weak var howitworksText: UITextView!
    
    let hiwCopy = """
    Breakfast Bowls are assembled the night before the morning you plan to eat them.  You select and combine a base grain, liquid, and whatever add-ins you like, and then let the mixture soak overnight in the refrigerator.  The following morning, add the fresh fruit and any additional toppings as desired, and enjoy!
    
    The Build Your Bowl function will walk you through 5 quick screens, each allowing you to select your grain, liquid, add-ins, fruit, and toppings via a simple toggle switch.  Not sure what something is?  Click the little arrow to the right of the ingredient to learn a bit more about it.  The intent and hope is to inspire you to learn about and try new ingredients, or perhaps a new combination of some of your current favorites.
    
    Once all of the ingredients are selected, the app will recap your bowl “recipe” so you may build it, share it, and rate it.  Please note - everyone has their own personal preferences so I do not provide exact measures of anything - I’ll leave that up to you in you want more or less of any particular ingredient.
    
    There are opportunities to learn more about the ingredients and equipment used to prepare the bowls, and links to purchase the non-perishable ingredients or equipment online.  I always recommend that you first try to buy locally, preferably from a small business, but have included online links in case you have difficulty sourcing some items.
    
    Now head back to the Main Menu and select "Build Your Bowl!" to get started.

    One more thing.  If you haven't figured it out, yes, this is a vegan app (excluding the honey).  Do you want to mix in non-vegan ingedients?  Feel free!  You do you.  Just have fun :)

    Note: As a rule of thumb, I use about 1/2 cup of whatever combination of grain(s) I select.  For the fruit, I usually toss it with a bit of fresh-squeezed lemon (or lime) juice to prevent browning, adding some Vitamin C to the bowl, and I find that it also just brightens up the flavor.
"""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        howitworksText.text = hiwCopy
     
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
