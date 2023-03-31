//
//  RecipeView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct RecipeView: View {
    let recipeId: String
    
    var body: some View {
        VStack {
            Text("Recipe")
        }
        .background(K.Colors.grayLight1.ignoresSafeArea())
        .onAppear {
            // Fetch recipe
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipeId: "5ed6604591c37cdc054bcd09")
    }
}
