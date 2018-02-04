//
//  IngredientDetailViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/14/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit

class IngredientDetailViewController: UIViewController {
    
    @IBOutlet weak var ingredientDetailPic: UIImageView!
    @IBAction func ingredientDetailPurch(_ sender: UIButton) {
        
    }
    @IBAction func ingredientDetailWiki(_ sender: UIButton) {
        
    }
    @IBOutlet weak var ingredientDetailCopy: UILabel!
    
    
    var ingredientDetailImages: String?
    var ingredientAddlCopy: String?
    var ingredientMoreInfo: String?
    var ingredientPurchase: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailPic = ingredientDetailImages {
            ingredientDetailPic.image = UIImage(named: detailPic)
        }
        
        if let detailCopy = ingredientAddlCopy {
            ingredientDetailCopy.text = detailCopy
        }
        
   // I think it's safe to completely delete the following, once I fugure out how to toggle Wiki/eCom buttons if URLs are provided...
   //     if let detailInfo = ingredientMoreInfo {
   //        let webURL = URL(string: detailInfo)
   //         let urlRequest = URLRequest(url: webURL!)
   //     }
        
   //     if let detailPurch = ingredientPurchase {
   //         let webURL = URL(string: detailPurch)
   //         let urlRequest = URLRequest(url: webURL!)
   //     }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowMoreInfo" {
            let detailViewController = segue.destination as! WebsiteViewController
            detailViewController.webSite = ingredientMoreInfo
        }
        
        if segue.identifier == "ShowOrderOnline" {
            let detailViewController = segue.destination as! WebsiteViewController
            detailViewController.webSite = ingredientPurchase
        }
        
    }
    

}
