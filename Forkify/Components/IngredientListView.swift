//
//  IngredientListView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

struct IngredientListView: View {
    var ingredients: [String]
    
    var body: some View {
        VStack {
            Text("Recipe ingredients".uppercased())
                .bold()
                .foregroundColor(.accentColor)
                .roundedFont(size: 20)
                .padding(.bottom, 25)
            
            VStack(alignment: .leading, spacing: 25) {
                ForEach(ingredients, id: \.self) { ingredient in
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
        IngredientListView(ingredients: testRecipe.formattedIngredients)
    }
}
