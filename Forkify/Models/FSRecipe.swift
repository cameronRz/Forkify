//
//  FSRecipe.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/31/23.
//

import SwiftUI

// MARK: - Recipe struct
struct FSRecipe {
    var id: String
    var title: String
    var publisher: String
    var imageURL: URL?
    var sourceURL: URL?
    var servings: Int?
    var cookingTime: Int?
    var ingredients: [FSIngredient]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case publisher
        case imageUrl
        case sourceUrl
        case servings
        case cookingTime
        case ingredients
    }
}

// MARK: - Recipe setters
extension FSRecipe: Identifiable, Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        publisher = try values.decode(String.self, forKey: .publisher)
        servings = try? values.decode(Int.self, forKey: .servings)
        cookingTime = try? values.decode(Int.self, forKey: .cookingTime)
        ingredients = try? values.decode([FSIngredient].self, forKey: .ingredients)
        
        if let imageUrl = try? values.decode(String.self, forKey: .imageUrl) {
            imageURL = resolveURL(url: imageUrl)
        }
        
        if let sourceUrl = try? values.decode(String.self, forKey: .sourceUrl) {
            sourceURL = resolveURL(url: sourceUrl)
        }
    }
    
    private func resolveURL(url: String) -> URL? {
        guard let http = URL(string: url),
              var components = URLComponents(url: http, resolvingAgainstBaseURL: false) else { return nil }
        
        // Force https scheme
        components.scheme = "https"
        return components.url
    }
}
