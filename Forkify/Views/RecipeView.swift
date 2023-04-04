//
//  RecipeView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var forkifyStore: ForkifyStore
    
    let recipeId: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let recipe = forkifyStore.recipe {
                VStack {
                    RecipeHeaderView(imageURL: recipe.imageURL)
                        .overlay(
                            BookmarkButton()
                                .padding(.trailing, 30)
                                .padding(.bottom, 50)
                            , alignment: .bottomTrailing
                        )
                    
                    RecipeTitleView(title: recipe.title)
                        .offset(y: -25)
                    
                    HStack {
                        IconDetailView(icon: .clock, descriptor: "Minutes", highlight: "\(recipe.cookingTime!)")
                        Spacer()
                        HStack {
                            IconDetailView(icon: .people, descriptor: "Servings", highlight: "\(forkifyStore.currentRecipeServings)")
                            ServingControls {
                                forkifyStore.increaseRecipeServings()
                            } onDecrease: {
                                forkifyStore.decreaseRecipeServings()
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 25)
                    
                    IngredientListView()
                    
                    DirectionsLinkView(publisher: testRecipe.publisher, sourceUrl: recipe.sourceURL!)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                }
            } else {
                RecipePlaceholderView()
            }
        }
        .background(K.Colors.grayLight1.ignoresSafeArea())
        .ignoresSafeArea(.container, edges: .top)
        .onAppear {
            forkifyStore.getRecipe(byId: recipeId)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipeId: "5ed6604591c37cdc054bcd09")
            .environmentObject(ForkifyStore())
    }
}
