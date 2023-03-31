//
//  ContentView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var forkifyStore: ForkifyStore
    
    // MARK: - Content
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - Top section
                TopBarView()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                // MARK: - Search section
                SearchView()
                    .padding()

                // MARK: - Results section
                if forkifyStore.isLoading {
                    LoaderView()
                        .centerVertical()
                } else {
                    if forkifyStore.recipes.isEmpty {
                        // MARK: - Placeholer message
                        VStack {
                            IconView(icon: .smiley)
                                .frame(width: 60)
                                .foregroundColor(.accentColor)
                            Text("Start by searching for a recipe or an ingredient. Have fun!")
                                .roundedFont(size: 20)
                                .foregroundColor(K.Colors.grayDark1)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 300)
                        }
                        .centerVertical()
                    } else {
                        // MARK: - Recipe results list
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(forkifyStore.recipes, id: \.id) { recipe in
                                    NavigationLink(destination: RecipeView(recipeId: recipe.id)) {
                                        RecipeTileView(recipe: recipe)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                    }
                }
                
                Spacer()
            }
            .background(K.Colors.grayLight1.ignoresSafeArea())
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ForkifyStore())
    }
}
