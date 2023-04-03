//
//  IngredientFormatter.swift
//  Forkify
//
//  Created by Cameron Ramirez on 4/3/23.
//

import Foundation

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
        guard servings < 21 else { return } // Max 20 servings
        
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
        ingredients = fsIngredients.compactMap {
            var ingredient = ""
            
            if let quantity = $0.quantity {
                ingredient = "\(fractionToString(value: quantity)) " // Trailing space
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
 // MARK: - Fraction formatter
extension IngredientFormatter {
    private func fractionToString(value: Double) -> String {
        var fractionString = ""
        var wholeNumber: Int?
        var fraction: Double?
        
        if value > 1 {
            wholeNumber = Int(value.whole)
            fraction = value.fraction
        } else {
            fraction = value
        }
        
        // The default is inaccurate but okay for this portfolio project
        switch fraction! {
        case 0.125..<0.126:
            fractionString = NSLocalizedString("\u{215B}", comment: "1/8")
        case 0.25..<0.26:
            fractionString = NSLocalizedString("\u{00BC}", comment: "1/4")
        case 0.33..<0.34:
            fractionString = NSLocalizedString("\u{2153}", comment: "1/3")
        case 0.5..<0.6:
            fractionString = NSLocalizedString("\u{00BD}", comment: "1/2")
        case 0.66..<0.67:
            fractionString = NSLocalizedString("\u{2154}", comment: "2/3")
        case 0.75..<0.76:
            fractionString = NSLocalizedString("\u{00BE}", comment: "3/4")
        default:
            fractionString = "1"
        }
        
        if var wholeNumber = wholeNumber {
            if fractionString.isInt {
                wholeNumber += Int(fractionString)!
                return "\(wholeNumber)"
            }
            
            return "\(wholeNumber) \(fractionString)"
        }
        
        return fractionString
    }
}
