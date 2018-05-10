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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        howitworksText.text = NSLocalizedString("hiwCopy", comment: "")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
