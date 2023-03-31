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

    var sourceUrl: String? = nil
    var servings: Int? = nil
    var cookingTime: Int? = nil
    var ingredients: [FSIngredient]? = nil
    
    // Made optional since it doesn't exist
    // on the JSON object
    var bookmarked: Bool? = false

    var imageURL: URL? {
        guard let url = imageUrl,
              let http = URL(string: url),
              var components = URLComponents(url: http, resolvingAgainstBaseURL: false) else { return nil }
        
        // Force https scheme
        components.scheme = "https"
        return components.url
    }
}
