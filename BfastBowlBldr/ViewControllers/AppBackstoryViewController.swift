//
//  AppBackstoryViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/21/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class AppBackstoryViewController: UIViewController {

    
    
    @IBOutlet var appbackstoryText: UITextView!
    
    let historyCopy = """
My name is Jim and this is the first app I have ever written.  Five years ago in 2012, as part of what started out as a regular annual doctor's checkup, I ultimately was diagnosed with very early-stage liver cancer.  That obviously disrupted my life for a bit.  Following the surgery and per the doctors recommendation I made some radical changes to my diet, electing to move towards a more plant-based diet.  Fast forward five years, and as of today in 2017 for v1.0 of this app, I remain cancer-free, feeling better than I think I ever have in my entire life.
    
Separately, as part of turning 50, I decided to learn how to code.  I’ve always been a bit of a tech nerd and it seemed everyone around me knew how to code.  Little kids were doing it for goodness sake, so if they could do it, then perhaps this old dog can learn a new trick too.
    
The “breakfast bowl” is a very ingrained part of my current diet and exercise routine, so when I was looking for an app to write as part of my coding education, the lightbulb went off and here we are.
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appbackstoryText.text = historyCopy

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
