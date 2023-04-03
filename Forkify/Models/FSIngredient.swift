//
//  FSIngredient.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

// Forkify Search Response Recipe Ingredient
struct FSIngredient: Decodable {
    var quantity: Double?
    var unit: String?
    var description: String?
}
