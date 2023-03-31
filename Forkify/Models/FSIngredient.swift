//
//  FSIngredient.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

// Forkify Search Response Recipe Ingredient
struct FSIngredient: Decodable {
    let quantity: Int
    let unit: String
    let description: String
}
