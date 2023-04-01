//
//  FSRecipe.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

// Forkify Search Response Recipe Data
struct FSRecipe: Identifiable, Decodable {
    let id: String
    let title: String
    let publisher: String
    let imageUrl: String?

    var sourceUrl: String?
    var servings: Int?
    var cookingTime: Int?
    var ingredients: [FSIngredient]?
    
    // Made optional since it doesn't exist on the JSON object
    var bookmarked: Bool? = false

    var imageURL: URL? {
        guard let url = imageUrl else { return nil }
        return resolveURL(url: url)
    }
    
    var sourceURL: URL? {
        guard let url = sourceUrl else { return nil }
        return resolveURL(url: url)
    }
    
    var formattedIngredients: [String] {
        guard let recipeIngredients = ingredients else { return [] }
        
        return recipeIngredients.compactMap {
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
    
    private func resolveURL(url: String) -> URL? {
        guard let http = URL(string: url),
              var components = URLComponents(url: http, resolvingAgainstBaseURL: false) else { return nil }
        
        // Force https scheme
        components.scheme = "https"
        return components.url
    }
    
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
