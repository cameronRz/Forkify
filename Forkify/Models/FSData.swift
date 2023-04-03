//
//  FSData.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import Foundation

// Forkify Search Response Data
struct FSData: Decodable {
    var recipe: FSRecipe?
    var recipes: [FSRecipe]?
}
