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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appbackstoryText.text = NSLocalizedString("historyCopy", comment: "")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
