//
//  IngredientListView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct IngredientListView: View {
    var ingredients: [FSIngredient]
    
    private var formattedIngredients: [String] {
        return ingredients.compactMap {
            var ingredient = ""
            
            if let quantity = $0.quantity {
                ingredient = "\(fractionToString(fraction: quantity)) " // Trailing space
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
    
    private func fractionToString(fraction: Double) -> String {
        switch fraction {
        case 0.125..<0.126:
            return NSLocalizedString("\u{215B}", comment: "1/8")
        case 0.25..<0.26:
            return NSLocalizedString("\u{00BC}", comment: "1/4")
        case 0.33..<0.34:
            return NSLocalizedString("\u{2153}", comment: "1/3")
        case 0.5..<0.6:
            return NSLocalizedString("\u{00BD}", comment: "1/2")
        case 0.66..<0.67:
            return NSLocalizedString("\u{2154}", comment: "2/3")
        case 0.75..<0.76:
            return NSLocalizedString("\u{00BE}", comment: "3/4")
        default:
            return "\(fraction)" // TODO: Add additional cases if necessary or convert to Int
        }
    }
    
    var body: some View {
        VStack {
            Text("Recipe ingredients".uppercased())
                .bold()
                .foregroundColor(.accentColor)
                .roundedFont(size: 20)
                .padding(.bottom, 25)
            
            VStack(alignment: .leading, spacing: 25) {
                ForEach(formattedIngredients, id: \.self) { ingredient in
                    HStack(spacing: 15) {
                        IconView(icon: .checkmark)
                            .frame(width: 17)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                        
                        Text(ingredient)
                            .foregroundColor(K.Colors.grayDark1)
                            .roundedFont()
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity)
        .background(K.Colors.grayLight2)
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView(ingredients: testRecipe.ingredients!)
    }
}
