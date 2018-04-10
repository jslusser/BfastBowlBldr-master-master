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
Breakfast Bowls are bes assembled the night before you plan to eat them.  You select and combine a base grain, liquid, and whatever add-ins you like, and then let the mixture soak overnight in the refrigerator.  The following morning, add the fresh fruit and any additional toppings as desired, and enjoy!

The Build Your Bowl function will walk you through 5 quick screens, each allowing you to select your grain, liquid, add-ins, fruit, and toppings via a simple toggle switch.  Not sure what something is?  Tap the ingredient name or the little arrow to the right of the ingredient to learn a bit more about it.  We all can be creatures of habit, eating the same things day after day.  The intent and hope is to inspire you to learn about and try new ingredients, or perhaps a new combination of some of your current favorites.  With 70+ ingredients, there are hundreds of unique possible Breakfast Bowl combinations to build.

Once all of the ingredients are selected, the app will recap your bowl “recipe” so you may build it, and in future versions of this app, to also share and rate it.  Please note - everyone has their own personal preferences so I do not provide exact measures of anything - I’ll leave that up to you if you want more or less of any particular ingredient.

There are opportunities to learn more about the ingredients and equipment used to prepare the bowls, and links to purchase the non-perishable ingredients and equipment online.  I always recommend that you first try to buy locally, preferably from a small business, but have included online links in case you have difficulty sourcing some items.  I do receive commissions for purchases made through some of the links in this app.

Now head back to the Main Menu and select "Build Your Bowl!" to get started.

One more thing.  If you haven't figured it out, yes, this is a vegan app (excluding the honey).  Do you want to mix in non-vegan ingedients?  Feel free!  You do you.  Just have fun :)

Note: As a rule of thumb, I use a total of approximately 1/2 cup of whatever combination of grain(s) I select.  For the fruit, I usually toss it with a bit of fresh-squeezed lemon (or lime) juice to prevent browning, adding some Vitamin C to the bowl, and I find that it also just brightens up the flavor.
"""
    override func viewDidLoad() {
        super.viewDidLoad()
        howitworksText.text = hiwCopy
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }   
}
