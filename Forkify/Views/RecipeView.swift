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
    
    private var howToCookMessage: AttributedString? {
        var message: AttributedString?
        
        do {
            message = try AttributedString(
                markdown: "This recipe was carefully designed and tested by **Closet Cooking**. Please check out directions at their website.")
        } catch {
            print("Couldn't parse: \(error)")
        }
        
        return message
    }
    
    var body: some View {
        NavigationStack {
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
                    
                    IngredientListView(ingredients: testRecipe.ingredients!)
                    
                    VStack {
                        Text("How to cook it".uppercased())
                            .bold()
                            .foregroundColor(.accentColor)
                            .roundedFont(size: 20)
                            .padding(.vertical)
                        
                        Text(howToCookMessage ?? "This recipe was carefully designed and tested by Closet Cooking. Please check out directions at their website.")
                            .foregroundColor(K.Colors.grayDark1)
                            .roundedFont()
                            .multilineTextAlignment(.center)

                        
                        Link(destination: URL(string: "https://google.com")!) {
                            HStack {
                                Text("Directions".uppercased())
                                    .fontWeight(.semibold)
                                    .roundedFont()
                                
                                IconView(icon: .arrowRight)
                                    .fontWeight(.semibold)
                                    .frame(width: 20)
                            }
                            .foregroundColor(K.Colors.grayLight1)
                            .padding(.vertical)
                            .padding(.horizontal, 30)
                            .background(K.Colors.gradient)
                            .clipShape(Capsule())
                        }
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                } // VStack
            }
            .background(K.Colors.grayLight1.ignoresSafeArea())
            .ignoresSafeArea(.container, edges: .top)
            // TODO: Figure out how to get the the navbar to show only when scrolling
//            .navigationTitle("Cauliflower Pizza Crust (with BBQ Chicken Pizza)")
//            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                //forkifyStore.getRecipe(byId: recipeId)
            }
        }
    }
}

struct ServingControls: View {
    var onIncrease: () -> Void
    var onDecrease: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                onDecrease()
            } label: {
                IconView(icon: .minus)
                    .frame(width: 20)
                    .fontWeight(.semibold)
            }

            Button {
                onIncrease()
            } label: {
                IconView(icon: .plus)
                    .frame(width: 20)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipeId: "5ed6604591c37cdc054bcd09")
            .environmentObject(ForkifyStore())
    }
}
