//
//  TestData.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import Foundation

let testRecipe = FSRecipe(
    id: "5ed6604591c37cdc054bcd09",
    title: "Cauliflower Pizza Crust (with BBQ Chicken Pizza)",
    publisher: "Closet Cooking",
    imageUrl: "http://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg", // Should be converted to https in the model
    sourceUrl: "http://www.allrecipes.com/recipe/228652/pepperoni-meatza/", // Should be converted to https in the model
    servings: 4,
    cookingTime: 75,
    ingredients: [
        FSIngredient(quantity: 1, unit: "", description: "medium head cauliflower cut into florets"),
        FSIngredient(quantity: 1, unit: "", description: "egg"),
        FSIngredient(quantity: 0.5, unit: "cup", description: "mozzarella shredded"),
        FSIngredient(quantity: 1, unit: "tsp", description: "oregano or italian seasoning blend"),
        FSIngredient(quantity: nil, unit: "", description: "Salt and pepper to taste"),
        FSIngredient(quantity: 1, unit: "cup", description: "chicken cooked and shredded"),
        FSIngredient(quantity: 0.5, unit: "cup", description: "barbecue sauce"),
        FSIngredient(quantity: 0.75, unit: "cup", description: "mozzarella shredded"),
        FSIngredient(quantity: nil, unit: "", description: "Red onion to taste thinly sliced"),
        FSIngredient(quantity: nil, unit: "", description: "Fresh cilantro to taste")
    ]
)
