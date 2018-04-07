//
//  RecipeDetailViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 4/2/18.
//  Copyright © 2018 James Slusser. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var recipeDetailPic: UIImageView!
    
    @IBOutlet weak var recipeDetailCopy: UITextView!
    
    var recipeDetailImages: String?
    var recipeAddlCopy: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeDetailPic.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        recipeDetailPic.addGestureRecognizer(pinchGesture)
        
        
        if let detailPic = recipeDetailImages {
            recipeDetailPic.image = UIImage(named: detailPic)
        }
        
        if let detailCopy = recipeAddlCopy {
            recipeDetailCopy.text = detailCopy
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
