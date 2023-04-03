//
//  IngredientFormatter.swift
//  Forkify
//
//  Created by Cameron Ramirez on 4/3/23.
//

import Foundation
import FractionFormatter

class IngredientFormatter: ObservableObject {
    var ingredients = [String]()
    var servings: Int = 1
    
    private var oldServings: Int = 1
    private var fsIngredients = [FSIngredient]()
    
    init(recipe: FSRecipe) {
        fsIngredients = recipe.ingredients ?? []
        servings = recipe.servings ?? 1
        oldServings = recipe.servings ?? 1
        formatIngredients()
    }
    
    func increaseServings() {
        oldServings = servings
        servings += 1
        updateFSIngredients()
        formatIngredients()
    }
    
    func decreaseServings() {
        guard servings != 1 else { return } // Min 1 serving
        
        oldServings = servings
        servings -= 1
        updateFSIngredients()
        formatIngredients()
    }
    
    private func updateFSIngredients() {
        fsIngredients = fsIngredients.compactMap { ingredient in
            if let quantity = ingredient.quantity {
                var updatedIngredient = ingredient
                updatedIngredient.quantity = quantity * Double(servings) / Double(oldServings)
                return updatedIngredient
            }
            
            return ingredient
        }
    }
    
    private func formatIngredients() {
        let fractionFormatter = FractionFormatter()
        
        ingredients = fsIngredients.compactMap {
            var ingredient = ""
            
            if let quantity = $0.quantity {
                let fraction = fractionFormatter.string(from: NSNumber(value: quantity))
                let value = fraction ?? "\(quantity)"
                ingredient = "\(value) " // Trailing space
            }
            
            if let unit = $0.unit, unit != "" {
                ingredient = "\(ingredient)\(unit) " // Trailing space
            }
            
            if let description = $0.description {
                ingredient = "\(ingredient)\(description)"
            }
            
            return ingredient
        }
    }
}
