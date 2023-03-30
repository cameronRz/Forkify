//
//  Recipe.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import Foundation

struct Recipe: Identifiable {
    let id: String
    let title: String
    let publisher: String
    let sourceUrl: String
    let image: String
    let servings: Int
    let cookingTime: Int
    let bookmarked: Bool
    let ingredients: [Ingredient]
}
