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
        ingredientDetailPic.isUserInteractionEnabled = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        ingredientDetailPic.addGestureRecognizer(pinchGesture)
        if let detailPic = ingredientDetailImages {
            ingredientDetailPic.image = UIImage(named: detailPic)
        }
        if let detailCopy = ingredientAddlCopy {
            ingredientDetailCopy.text = detailCopy
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "ShowOrderOnline":
            guard ingredientPurchase != "NotAvailable" else {
                let alert = UIAlertController(title: "Bowl Builder Tip", message: "Order Online is not available for any Fruit - please attempt to source it locally", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                present(alert, animated: true, completion: nil)
                return false
            }
        default:
            break
        }
        return true
    }
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
