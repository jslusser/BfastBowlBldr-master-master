//
//  Ingredient.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 10/3/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import Foundation

struct Ingredient {
    let name: String
    let imageString: String
    let copy: String
    let info: String
    let purchaseURL: String
    let type: IngredientType
}

enum IngredientType {
    case grain, liquid, fruit, addIn, topping
}
