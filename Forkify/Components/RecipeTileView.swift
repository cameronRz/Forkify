//
//  RecipeTileView.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

struct RecipeTileView: View {
    var recipe: FSRecipe
    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: - Recipe image
            VStack {
                AsyncImage(url: recipe.imageURL) { image in
                    ZStack {
                        image
                            .resizable()
                            .scaledToFill()
                        
                        K.Colors.gradient.opacity(0.4)
                    }
                } placeholder: {
                    ZStack {
                        K.Colors.gradient.opacity(0.4)
                        
                        IconView(icon: .logo)
                            .padding()
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: 70, height: 70)
            .clipShape(Circle())

            // MARK: - Recipe name
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.title.uppercased())
                    .lineLimit(1)
                    .fontWeight(.semibold)
                    .roundedFont()
                    .foregroundColor(.accentColor)
                
                Text(recipe.publisher.uppercased())
                    .fontWeight(.semibold)
                    .roundedFont(size: 11)
                    .foregroundColor(K.Colors.grayDark2)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct RecipeTileView_Previews: PreviewProvider {
    static let recipe = FSRecipe(
        id: "5ed6604591c37cdc054bcd09",
        title: "Cauliflower Pizza Crust (with BBQ Chicken Pizza)",
        publisher: "Closet Cooking",
        imageURL: URL(string: "https://forkify-api.herokuapp.com/images/BBQChickenPizzawithCauliflowerCrust5004699695624ce.jpg")
    )
    
    static var previews: some View {
        RecipeTileView(recipe: recipe)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
