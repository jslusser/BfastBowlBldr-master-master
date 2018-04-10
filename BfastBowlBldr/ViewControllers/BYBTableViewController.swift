//
//  BYBTableViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 3/22/18.
//  Copyright © 2018 James Slusser. All rights reserved.
//

import UIKit

class BYBTableViewController: UITableViewController {

    var ingredients = [Ingredient]()
    var selectedIngredients = [Ingredient]()
     var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
         ingredients = selectedIngredients
        tableView.estimatedRowHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bowlCell", for: indexPath) as! BuildYourBowlTableViewCell

        let row = indexPath.row
        cell.bowlNames.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.bowlNames.text = ingredients[row].name
        cell.bowlImages.image = UIImage(named: ingredients[row].imageString)

        return cell
    }
    @objc func doneTapped() {
    self.navigationController?.popToRootViewController(animated: true)
        print ("Hello World")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.visibleCells.enumerated().forEach { (index, cell) in
            cell.transform = CGAffineTransform(translationX: CGFloat(index) * 50 + self.tableView.bounds.size.width, y: 0)
        }
        UIView.animate(withDuration: 3.0) {
            self.tableView.visibleCells.forEach { $0.transform = .identity}
        }
    }
}
