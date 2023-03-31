//
//  FSIngredient.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

// Forkify Search Response Recipe Ingredient
struct FSIngredient: Decodable {
    let quantity: Double?
    let unit: String?
    let description: String?
}
