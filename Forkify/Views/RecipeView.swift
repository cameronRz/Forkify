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
            VStack {
                RecipeHeaderView() // Pass imageURL
                    .overlay(
                        BookmarkButton()
                            .padding(.trailing, 30)
                            .padding(.bottom, 50)
                        , alignment: .bottomTrailing
                    )
                
                RecipeTitleView(title: "Cauliflower Pizza Crust (with BBQ Chicken Pizza)")
                    .offset(y: -25)
                
                HStack {
                    IconDetailView(icon: .clock, descriptor: "Minutes", highlight: "60")
                    Spacer()
                    HStack {
                        IconDetailView(icon: .people, descriptor: "Servings", highlight: "4")
                        
                        ServingControls {
                            print("Increasing servings")
                        } onDecrease: {
                            print("Decreasing servings")
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 25)
                
                IngredientListView(ingredients: testRecipe.formattedIngredients)
                
                DirectionsLinkView(publisher: testRecipe.publisher, sourceUrl: testRecipe.sourceURL!)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
            }
        }
        .background(K.Colors.grayLight1.ignoresSafeArea())
        .ignoresSafeArea(.container, edges: .top)
        .onAppear {
            //forkifyStore.getRecipe(byId: recipeId)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipeId: "5ed6604591c37cdc054bcd09")
            .environmentObject(ForkifyStore())
    }
}
